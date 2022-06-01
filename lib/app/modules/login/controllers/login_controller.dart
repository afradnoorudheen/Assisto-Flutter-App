import 'package:assisto/app/modules/sign_up/views/sign_up_view.dart';
import 'package:assisto/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController idController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  onLoginPressed() {}

  onSignUpPressed() {
    Get.toNamed(Routes.SIGN_UP);
  }

  onSendOTP() {}

  onSignInWithGoogle() {}

  onLogInPressed() {
    Get.back();
  }

  googleSignUp() {}
}
