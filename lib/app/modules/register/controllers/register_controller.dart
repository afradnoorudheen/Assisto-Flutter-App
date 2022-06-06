import 'package:assisto/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../auth/controllers/auth_controller.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController googleIDController = TextEditingController();
  TextEditingController mailIDController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  AuthController authController = Get.find();
  User_? user;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    user = authController.user_;
    firstNameController.text = user!.firstName?? "";
    lastNameController.text = user!.lastName?? "";
    dobController.text = user!.dob?? "";
    genderController.text = user!.gender?? "";
    mailIDController.text = user!.mailID?? "";
    googleIDController.text = user!.googleID?? "";

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  onCompletePressed() async {
    User user = authController.user!;

    await FirebaseFirestore.instance.collection('user').doc(user.uid).set(
        User_(
          id: user.uid,
          firstName: firstNameController.text,
          googleID: googleIDController.text,
          mailID: mailIDController.text,
          lastName: lastNameController.text,
          gender: genderController.text,
          dob: dobController.text,
        ).toFirebase(),
        SetOptions(merge: true));
    Get.toNamed(Routes.HOME);
  }

  onLogInPressed() {}
}
