import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:resource/app/features/routes/routes.dart';

class UserDetailsController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  late GetStorage userDetails;

  final List<String> level = ['100', '200', '300', '400'];
  final List<String> semester = ['1', '2'];

  final programmeName = <String>[].obs;
  final isLoading = false.obs;
  late Rx<TextEditingController> myProgrammeText = TextEditingController().obs;

  final selectedProgramme = ''.obs;
  final selectedLevel = '100'.obs;
  final selectedSemester = '1'.obs;

  @override
  void onInit() {
    fetcheCourseName();
    userDetails = GetStorage(auth.currentUser!.uid);  

    super.onInit();
  }

  void saveSelections() {
    userDetails.write(
      'selections',
      {
        'course': selectedProgramme.value,
        'level': selectedLevel.value,
        'semester': selectedSemester.value,
      },
    );
    Get.offAllNamed(AppRoutes.home);
  }

  void fetcheCourseName() async {
    isLoading.value = true;
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance.collection('programme').doc('programmeList').get();
     
        if (documentSnapshot.exists && documentSnapshot.data() != null) {
        var data = documentSnapshot.data() as Map<String, dynamic>;
        if(data.containsKey('courses')){
          List fetchedCourses = data['courses'];
          programmeName.value = List.from(fetchedCourses);
        }else{
          Get.snackbar('Error', 'The "programme" field does not exist.');
        }
        }else{
          Get.snackbar('Error', 'The "programme" field does not exist.');
        }
      // QuerySnapshot snapshot =
      //     await FirebaseFirestore.instance.collection('courses').get();
      // Set<String> fetchedNames = {};

      // for (var document in snapshot.docs) {
      //   fetchedNames.add(document['programme']);
      // }

      // programmeName.value = fetchedNames.toList();
    } catch (e) {
      Get.snackbar('Error', 'Try again');
    } finally {
      isLoading.value = false;
    }
  }
}
