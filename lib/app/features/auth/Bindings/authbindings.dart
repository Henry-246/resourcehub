import 'package:get/get.dart';
import 'package:resource/app/features/auth/controllers/auth_controller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AuthController(),
    );
  }
}
