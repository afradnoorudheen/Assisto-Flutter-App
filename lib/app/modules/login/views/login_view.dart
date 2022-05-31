import 'dart:ui';

import 'package:assisto/app/theme/theme.dart';
import 'package:assisto/app/widgets/textField.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme_.pageBg,
      ),
      body: Container(
        width: double.infinity,
        color: Theme_.pageBg,
        padding: EdgeInsets.only(top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
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
              margin: EdgeInsets.symmetric(horizontal: 30),
              width: double.infinity,
              child: Column(
                children: [
                  AssistoTextField(
                    hintText: "Username",
                    controller: controller.nameController,
                    prefixIcon: SizedBox(
                        child: Center(child: FaIcon(FontAwesomeIcons.user)),
                        height: 25,
                        width: 25),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AssistoTextField(
                    hintText: "Password",
                    controller: controller.passwordController,
                    obscureText: true,
                    viewButton: true,
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
                    child: GestureDetector(
                      onTap: controller.onLoginPressed(),
                      child: LoginButton(),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: GestureDetector(
                      onTap: controller.onLoginPressed(),
                      child: SignInWithGoogle(),
                    ),
                  ),
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
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                ),
              ),
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

class SignInWithGoogle extends StatelessWidget {
  const SignInWithGoogle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return;
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 51,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xFF3946B0).withOpacity(0.34),
            blurRadius: 40,
            offset: Offset(0, 16),
          ),
        ],
        borderRadius: BorderRadius.circular(19),
        color: Theme_.aBlue,
      ),
      child: Center(
        child: Text(
          "Login",
          style: Theme_.tS20white,
        ),
      ),
    );
  }
}
