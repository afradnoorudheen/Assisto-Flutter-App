import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Image.asset(
          "assets/images/splash.png",
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
