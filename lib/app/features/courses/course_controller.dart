import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CourseController extends GetxController {
  final auth = FirebaseAuth.instance;
  late GetStorage userDetails;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  var courses = <QueryDocumentSnapshot>[].obs;
  RxBool isLoading = false.obs;

  String programme = '';
  String level = '';
  String semester = '';

  @override
  void onInit() async {
    await GetStorage.init(auth.currentUser!.uid);
    userDetails = GetStorage(auth.currentUser!.uid);
    final details = userDetails.read('selections');
    programme = details['course'];
    level = details['level'];
    semester = details['semester'];
    if(programme.isNotEmpty){
      fetchCourses();
    }
    
    super.onInit();
  }

  Future<void> fetchCourses() async {
    isLoading.value = true;
    if (programme == "Computer Science") {
      try {
      QuerySnapshot snapshot = await firestore
          .collection('computerScience')
          .where('programme', isEqualTo: programme)
          .where('level', isEqualTo: level)
          .where('semester', isEqualTo: semester)
          .get();

      courses.value = snapshot.docs;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load courses');
    } finally {
      isLoading.value = false;
    }
    }else{
      try {
      QuerySnapshot snapshot = await firestore
          .collection(programme)
          .where('programme', isEqualTo: programme)
          .where('level', isEqualTo: level)
          .where('semester', isEqualTo: semester)
          .get();

      courses.value = snapshot.docs;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load courses');
    } finally {
      isLoading.value = false;
    }
    }
  }
}
