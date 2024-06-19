import 'package:get/get.dart';
import 'package:resource/app/features/userdetails/userdetailscontroller.dart';

class UserDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => UserDetailsController(),
    );
  }
}
