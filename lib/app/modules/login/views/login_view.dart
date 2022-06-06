import 'package:assisto/app/theme/theme.dart';
import 'package:assisto/app/widgets/textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return PgContainer(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        // backgroundColor: Colors.transparent,
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          height: 80,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45),
                topRight: Radius.circular(45),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF667197).withOpacity(0.08),
                  blurRadius: 40,
                  offset: Offset(0, -6),
                )
              ]),
          /* child:  Row(
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
          ), */
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
                        SizedBox(height: 15),
                        SizedBox(
                          height: 10,
                        ),
                        AssistoTextField(
                          hintText: "Phone",
                          controller: controller.phoneController,
                          //viewButton: true,
                          prefixIcon: Center(child: AImg(name: 'user')),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        /*  Container(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {
                                print("Forgot Password Pressed");
                              },
                              child: Text(
                                "Forgot Password?",
                                style: Theme_.ts5sGreyEL.copyWith(fontSize: 16),
                              )),
                        ), */
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: AButton(
                      label: 'Send OTP',
                      onPressed: () {
                        Get.dialog(_buildOTPDialog());
                        controller.onSendOTP();
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Divider(
                        thickness: 2,
                        indent: 60,
                        endIndent: 15,
                      )),
                      Text(
                        'or',
                        style: Theme_.ts6sGreyL,
                      ),
                      Expanded(
                          child: Divider(
                        thickness: 2,
                        indent: 15,
                        endIndent: 60,
                      )),
                    ],
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        SignInWithGoogle(
                          onPressed: controller.onSignInWithGoogle,
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

  Widget _buildOTPDialog() {
    return Dialog(
      insetPadding: EdgeInsets.all(20),
      child: IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Verify',
                    style: Theme_.ts2r.copyWith(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Text(
                'Enter the 4 -digit code which is send to your mail',
                style: Theme_.ts6sGreyL.copyWith(fontWeight: FontWeight.w500),
              ),
              Container(
                height: 100,
                width: 300,
                child: FittedBox(
                  child: OtpTextField(
                    fieldWidth: 60, textStyle: Theme_.ts4s,
                    numberOfFields: 6,
                    borderRadius: BorderRadius.circular(30),
                    borderColor: Color(0xFF512DA8),
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    onSubmit: (String verificationCode) {
                      controller.otp = verificationCode;
                      controller.verifyAndLogin();
                    },
                  ),
                ),
              ),
              AButton(
                  label: 'Verify',
                  onPressed: () {
                    controller.verifyAndLogin();
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not received the mail?",
                    style: Theme_.ts6r.copyWith(
                        color: Theme_.greyD, fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                    onPressed: controller.onLogInPressed,
                    child: Text(
                      "Resend",
                      style: Theme_.ts6r.copyWith(
                          color: Theme_.aBlue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignInWithGoogle extends StatelessWidget {
  final VoidCallback onPressed;
  const SignInWithGoogle({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
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
  late final Color? color;
  AImg(
      {Key? key,
      required this.name,
      this.height = 20,
      this.width = 20,
      Color? color})
      : super(key: key) {
    this.color = color;
  }

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

class WhiteButton extends StatelessWidget {
  final Widget child;
  const WhiteButton({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(32)),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF667197).withOpacity(0.08),
              blurRadius: 40,
              offset: Offset(0, 16),
            ),
          ]),
      child: child,
    );
  }
}
