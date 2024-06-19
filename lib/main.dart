import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:resource/app/features/auth/Bindings/authbindings.dart';
import 'package:resource/app/features/routes/pages.dart';
import 'package:resource/app/features/routes/routes.dart';
import 'package:resource/firebase_options.dart';

void main() async {
  GetStorage.init();
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      getPages: AppPages.pages,
      initialRoute: AppRoutes.auth,
      initialBinding: AuthBindings(),
      themeMode: ThemeMode.dark,
    );
  }
}
