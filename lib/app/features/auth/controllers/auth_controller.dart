import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/app/features/routes/routes.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var emailController = TextEditingController();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        Get.offAllNamed(AppRoutes.userdetails);
      }
    });
  }

  void signInWithEmailAndPassword() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        Get.snackbar('Success', 'Signed in successfully!');
        Get.offAllNamed(AppRoutes.userdetails);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Get.snackbar('Error', 'No user found for that email.');
        } else if (e.code == 'wrong-password') {
          Get.snackbar('Error', 'Wrong password provided.');
        } else {
          Get.snackbar('Error', e.message ?? 'An error occurred.');
        }
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<void> registerWithEmailAndPassword() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        await credential.user!.updateDisplayName(usernameController.text);
        await credential.user!.reload();
        // Save the username to Firestore
        // await FirebaseFirestore.instance
        //     .collection('users')
        //     .doc(credential.user!.uid)
        //     .set({
        //   'username': usernameController.text,
        //   'email': emailController.text,
        // });

        // The authStateChanges listener will handle navigation on successful registration
        Get.snackbar(
          'Success',
          'Account created successfully!',
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Get.snackbar('Error', 'The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          Get.snackbar('Error', 'The account already exists for that email.');
        } else {
          Get.snackbar('Error', e.message ?? 'An error occurred.');
        }
      } catch (e) {
        Get.snackbar('Error', e.toString());
      } finally {
        isLoading.value = false;
      }
    }
  }

  void navigateToRegister() {
    Get.offNamed(AppRoutes.register);
  }

  void navigateToAuth() {
    Get.offNamed(AppRoutes.auth);
  }
}
