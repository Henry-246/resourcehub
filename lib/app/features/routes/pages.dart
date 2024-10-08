import 'package:get/get.dart';
import 'package:resource/app/features/auth/Bindings/authbindings.dart';
import 'package:resource/app/features/auth/page/authpage.dart';
import 'package:resource/app/features/auth/page/registerpage.dart';
import 'package:resource/app/features/home/home.dart';
import 'package:resource/app/features/home/home_bindings.dart';
import 'package:resource/app/features/userdetails/userdetailsbinding.dart';
import 'package:resource/app/features/userdetails/userdetailspage.dart';
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
      page: () =>  HomePage(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: AppRoutes.userdetails,
      page: () => const UserDetailsPage(),
      binding: UserDetailsBinding(),
    ),
  ];
}
