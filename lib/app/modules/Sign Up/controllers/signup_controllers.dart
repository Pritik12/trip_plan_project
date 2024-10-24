import 'package:get/get.dart';

class SignupController extends GetxController {
  var fullName = ''.obs;
  var email = ''.obs;
  var password = ''.obs;


  void signUp() {
    if (fullName.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {

      print("Signup successful");

      // Get.to(HomeView()); // Example navigation
    } else {
      Get.snackbar('Error', 'Please fill in all the fields');
    }
  }
}