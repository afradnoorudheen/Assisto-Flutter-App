import 'package:assisto/app/modules/sign_up/views/sign_up_view.dart';
import 'package:assisto/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String? verificationId, otp;
  final auth = FirebaseAuth.instance;
  @override
  void onInit() {
    super.onInit();
  }

  onLoginPressed() {}

  onSignUpPressed() {
    Get.toNamed(Routes.SIGN_UP);
  }

  onSignInWithGoogle() {}

  onLogInPressed() {
    Get.back();
  }

  googleSignUp() {}

  onSendOTP() async {
    await auth.verifyPhoneNumber(
      phoneNumber: '+91${phoneController.text}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _onLoginSuccess(credential);
      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> _onLoginSuccess(PhoneAuthCredential credential) async {
    await auth.signInWithCredential(credential);
    Get.offAllNamed(Routes.ANALYSE_AUDIO);
  }

  verifyOTP() {}

  verifyAndLogin() async {
    PhoneAuthCredential authCredential = PhoneAuthProvider.credential(
        verificationId: verificationId!, smsCode: otp!);
    await _onLoginSuccess(authCredential);
  }
}
