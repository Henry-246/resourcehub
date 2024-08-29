import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:resource/app/features/ai/askai.dart';
import 'package:resource/app/features/courses/courses.dart';
import 'package:resource/app/features/routes/routes.dart';
import 'package:resource/app/mydrawerbutton.dart';

class MenuScreen extends StatelessWidget {
  final Function(int) onItemSelected;

  const MenuScreen({super.key, required this.onItemSelected});
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Text(
                "Resource Hub",
                style: GoogleFonts.ubuntu(
                  fontSize: screenwidth * 0.056,
                  color: Colors.white,
                  shadows: [
                   const Shadow(
                    offset: Offset(0, 1),
                    blurRadius: 3,
                    color: Color.fromARGB(128, 0, 0, 0),
                  ),
                ],
                ),
              ),
              const SizedBox(height: 50),
              MyDrawerButton(
                icon: const Icon(
                  Ionicons.folder,
                  color: Colors.white,
                  size: 30,
                ),
                text: 'Courses',
                onTap: () => onItemSelected(0),
              ),
              MyDrawerButton(
                icon: const Icon(
                  Ionicons.bulb,
                  color: Colors.white,
                  size: 30,
                ),
                text: 'Ask Ai',
                onTap: () => onItemSelected(1),
              ),
              MyDrawerButton(
                icon: const Icon(
                  Ionicons.settings,
                  color: Colors.white,
                  size: 30,
                ),
                text: 'Edit Details',
                onTap:() {
                  Get.toNamed(AppRoutes.userdetails);
                },
              ),
              const Spacer(),
              MyDrawerButton(
                icon: const Icon(
                  Ionicons.log_out,
                  color: Colors.white,
                  size: 30,
                ),
                text: 'Logout',
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Get.offAllNamed('/');

                  Get.snackbar('Logout', 'User logged out successfully');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
