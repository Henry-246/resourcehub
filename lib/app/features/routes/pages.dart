import 'package:get/get.dart';
import 'package:resource/app/features/auth/Bindings/authbindings.dart';
import 'package:resource/app/features/auth/page/authpage.dart';
import 'package:resource/app/features/auth/page/registerpage.dart';
import 'package:resource/app/features/home/home.dart';
import 'package:resource/app/features/home/home_bindings.dart';
import 'routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.auth,
      page: () => const AuthPage(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterPage(),
      binding: AuthBindings(),
    ),
    GetPage(
        name: AppRoutes.home,
        page: () => const HomePage(),
        binding: HomeBindings())
  ];
}
