import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home ${user.email}"),
            Text("Home ${user.displayName}"),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Get.offAllNamed('/');
              },
              child: const Text('Sign Out'),
            )
          ],
        ),
      ),
    );
  }
}
