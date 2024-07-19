import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String programme = '';
  late String level;
  late String semester;
  late GetStorage userDetails;

  @override
  void initState() {
    GetStorage.init(FirebaseAuth.instance.currentUser!.uid);
    userDetails = GetStorage(FirebaseAuth.instance.currentUser!.uid);
    final details = userDetails.read('selections');
    programme = details['course'];
    level = details['level'];
    semester = details['semester'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                user.displayName!,
                style: GoogleFonts.ubuntu(
                  fontSize: 35,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  Get.offAllNamed('/userdetails');
                },
                child: const Text('Edit'),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Course",
                      style: GoogleFonts.ubuntu(
                        fontSize: 25,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    Text(
                      programme,
                      style: GoogleFonts.ubuntu(
                        fontSize: 25,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(color: Colors.black54, thickness: 1),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Level",
                      style: GoogleFonts.ubuntu(
                        fontSize: 25,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    Text(
                      level,
                      style: GoogleFonts.ubuntu(
                        fontSize: 25,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(color: Colors.black54, thickness: 1),
              InkWell(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Get.offAllNamed('/');
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "LogOut",
                        style: GoogleFonts.ubuntu(
                          fontSize: 25,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      const Icon(
                        Ionicons.log_out_outline,
                        size: 30,
                      )
                    ],
                  ),
                ),
              ),
              const Divider(color: Colors.black54, thickness: 1),
            ],
          ),
        ),
      ),
    );
  }
}


//  body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("Home ${user.email}"),
//             Text("Home ${user.displayName}"),
//             ElevatedButton(
//               onPressed: () async {
//                 await FirebaseAuth.instance.signOut();
//                 Get.offAllNamed('/');
//               },
//               child: const Text('Sign Out'),
//             )
//           ],
//         ),
//       ),

