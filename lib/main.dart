import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:resource/app/features/auth/Bindings/authbindings.dart';
import 'package:resource/app/features/home/home_bindings.dart';
import 'package:resource/app/features/routes/pages.dart';
import 'package:resource/app/features/routes/routes.dart';
import 'package:resource/firebase_options.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool isAuthenticated = FirebaseAuth.instance.currentUser != null;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      getPages: AppPages.pages,
      initialRoute: isAuthenticated ? AppRoutes.home : AppRoutes.auth,
      initialBinding: isAuthenticated ? HomeBindings() : AuthBindings(),
      themeMode: ThemeMode.dark,
    );
  }
}
