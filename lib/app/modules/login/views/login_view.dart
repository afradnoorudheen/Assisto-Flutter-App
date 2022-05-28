import 'dart:ui';

import 'package:assisto/app/theme/theme.dart';
import 'package:assisto/app/widgets/textField.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme_.pageBg,
      ),
      body: Container(
        width: double.infinity,
        color: Theme_.pageBg,
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    style: Theme_.ts0r,
                  ),
                  Text(
                    "Sign in to Continue",
                    style: Theme_.ts2r.copyWith(color: Theme_.greyL),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  AssistoTextField(
                      hintText: "Username",
                      controller: controller.nameController),
                  SizedBox(
                    height: 10,
                  ),
                  AssistoTextField(
                    hintText: "Password",
                    controller: controller.passwordController,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          print("Forgot Password Pressed");
                        },
                        child: Text(
                          "Forgot Password?",
                          style: Theme_.ts5lGreyL,
                        )),
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text("Login"),
                      onPressed: controller.onLoginPressed,
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: Image.asset(
                'assets/images/assisto.png',
                height: 80,
                fit: BoxFit.fitHeight,
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? "),
                  TextButton(
                    onPressed: controller.onSignUpPressed,
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Theme_.aBlue),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
