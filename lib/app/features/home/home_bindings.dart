import 'package:get/get.dart';
import 'package:resource/app/features/home/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(),
    );
  }
}
