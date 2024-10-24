import 'package:get/get.dart';
import 'package:jotrip/app/modules/sign_in/sign_in_controller.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
  }
}
