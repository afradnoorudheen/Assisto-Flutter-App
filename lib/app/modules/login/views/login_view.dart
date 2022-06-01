import 'package:assisto/app/theme/theme.dart';
import 'package:assisto/app/widgets/textField.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return PgContainer(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        bottomNavigationBar: Container(
          height: 80,
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
              Text(
                "Don't have an account?",
                style: Theme_.ts6r
                    .copyWith(color: Theme_.greyD, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: controller.onSignUpPressed,
                child: Text(
                  "Sign Up",
                  style: Theme_.ts6r.copyWith(
                      color: Theme_.aBlue, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: SizedBox(
              height: Get.height - 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Login",
                          style:
                              Theme_.ts0r.copyWith(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Sign in to continue!",
                          style: Theme_.ts2r.copyWith(color: Theme_.greyEL),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        AssistoTextField(
                          hintText: "Username",
                          controller: controller.nameController,
                          prefixIcon: Center(child: AImg(name: 'user')),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        AssistoTextField(
                          hintText: "Password",
                          controller: controller.passwordController,
                          obscureText: true,
                          //viewButton: true,
                          prefixIcon: Center(child: AImg(name: 'lock')),
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
                                style: Theme_.ts5sGreyEL.copyWith(fontSize: 16),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        AButton(
                          label: "Login",
                          onPressed: controller.onLoginPressed,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: controller.onLoginPressed(),
                          child: SignInWithGoogle(),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Center(
                    child: Image.asset(
                      'assets/images/assisto.png',
                      height: 80,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SignInWithGoogle extends StatelessWidget {
  const SignInWithGoogle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 51,
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0xFF667197).withOpacity(0.08),
          blurRadius: 40,
          offset: Offset(0, 16),
        ),
      ], borderRadius: BorderRadius.circular(19), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            'assets/images/google.png',
            height: 25,
            width: 25,
          )),
          SizedBox(
            width: 10,
          ),
          Text("Connect with Google", style: Theme_.ts5rGreyEL),
        ],
      ),
    );
  }
}

class AButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const AButton({Key? key, required this.label, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 51,
        margin: EdgeInsets.symmetric(horizontal: 15),
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
            label,
            style: Theme_.ts5r.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class AImg extends StatelessWidget {
  final String name;
  final double height, width;
  final Color? color;
  const AImg(
      {Key? key,
      required this.name,
      this.color = Theme_.grey,
      this.height = 20,
      this.width = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/$name.png",
      height: height,
      width: width,
      color: color,
    );
  }
}

class PgContainer extends StatelessWidget {
  final Widget child;

  const PgContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.white, Color(0xFFEBEBEB)],
      )),
      child: child,
    );
  }
}
