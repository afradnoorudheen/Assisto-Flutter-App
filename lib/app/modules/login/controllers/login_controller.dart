import 'package:assisto/app/modules/auth/controllers/auth_controller.dart';
import 'package:assisto/app/modules/sign_up/views/sign_up_view.dart';
import 'package:assisto/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  onSignUpPressed() {
    Get.toNamed(Routes.SIGN_UP);
  }

  onSignInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    final user = await auth.signInWithCredential(credential);
    await writeUserDetailsToFirebase(user.user!);
    Get.find<AuthController>().checkAuth();
    // Get.offAllNamed(Routes.AUTH);
  }

  writeUserDetailsToFirebase(User user) async {
    await FirebaseFirestore.instance.collection('user').doc(user.uid).set(
        User_(
                id: user.uid,
                firstName: user.displayName,
                googleID: user.email,
                mailID: user.email)
            .toFirebase(),
        SetOptions(merge: true));
  }

  onLogInPressed() {
    Get.back();
  }

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
    final user = await auth.signInWithCredential(credential);
    await writeUserDetailsToFirebase(user.user!);
    Get.offAllNamed(Routes.AUTH);
  }

  verifyAndLogin() async {
    PhoneAuthCredential authCredential = PhoneAuthProvider.credential(
        verificationId: verificationId!, smsCode: otp!);
    await _onLoginSuccess(authCredential);
  }
}
