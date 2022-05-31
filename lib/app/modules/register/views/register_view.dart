import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../../../theme/theme.dart';
import '../../../widgets/textField.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
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
        child: SingleChildScrollView(
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
                      "Sign Up",
                      style: Theme_.ts0r,
                    ),
                    Text(
                      "Complete your registration!",
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
                      hintText: "First Name",
                      controller: controller.firstNameController,
                      prefixIcon: SizedBox(
                          child: Center(child: FaIcon(FontAwesomeIcons.user)),
                          height: 25,
                          width: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AssistoTextField(
                      hintText: "Last Name",
                      controller: controller.firstNameController,
                      prefixIcon: SizedBox(
                          child: Center(child: FaIcon(FontAwesomeIcons.user)),
                          height: 25,
                          width: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AssistoTextField(
                      hintText: "DOB",
                      controller: controller.firstNameController,
                      prefixIcon: SizedBox(
                          child:
                              Center(child: FaIcon(FontAwesomeIcons.calendar)),
                          height: 25,
                          width: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AssistoTextField(
                      hintText: "Gender",
                      controller: controller.firstNameController,
                      prefixIcon: SizedBox(
                          child: Center(
                              child: FaIcon(FontAwesomeIcons.genderless)),
                          height: 25,
                          width: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AssistoTextField(
                      hintText: "Google ID",
                      controller: controller.firstNameController,
                      prefixIcon: SizedBox(
                          child: Center(child: FaIcon(FontAwesomeIcons.google)),
                          height: 25,
                          width: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AssistoTextField(
                      hintText: "Facebook ID",
                      controller: controller.firstNameController,
                      prefixIcon: SizedBox(
                          child:
                              Center(child: FaIcon(FontAwesomeIcons.facebook)),
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
                      prefixIcon: SizedBox(
                          child: Center(child: FaIcon(FontAwesomeIcons.lock)),
                          height: 25,
                          width: 25),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    AssistoTextField(
                      hintText: "Confirm Password",
                      controller: controller.confirmPasswordController,
                      obscureText: true,
                      viewButton: true,
                      prefixIcon: SizedBox(
                          child: Center(child: FaIcon(FontAwesomeIcons.lock)),
                          height: 25,
                          width: 25),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: double.infinity,
                      child: GestureDetector(
                        onTap: controller.onCompletePressed(),
                        child: LoginButton(),
                      ),
                    ),
                  ],
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
                      onPressed: controller.onLogInPressed,
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
      ),
    );
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
          "Complete",
          style: Theme_.tS20white,
        ),
      ),
    );
  }
}
