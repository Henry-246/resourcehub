import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/app/features/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hoem ${user.email}"),
            Text("Hoem ${user.displayName}"),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Get.offAllNamed('/');
              },
              child: Text('Sign Out'),
            )
          ],
        ),
      ),
    );
  }
}
