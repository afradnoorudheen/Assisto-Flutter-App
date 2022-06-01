import 'package:assisto/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../../../theme/theme.dart';
import '../../../widgets/textField.dart';
import '../../login/views/login_view.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return PgContainer(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF3946B0),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
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
                onPressed: controller.onLogInPressed,
                child: Text(
                  "Log in",
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
              height: Get.height - 80 - 50 - Get.mediaQuery.padding.top,
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
                          "Sign Up",
                          style:
                              Theme_.ts0r.copyWith(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Create account to get started.",
                          style: Theme_.ts2r.copyWith(color: Theme_.greyEL),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        SignInWithGoogle(),
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
                          child: AssistoTextField(
                            hintText: "E-mail or Phone",
                            controller: controller.idController,
                            prefixIcon: Center(child: AImg(name: 'user')),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: AButton(
                      label: 'Send OTP',
                      onPressed: controller.onSendOTP,
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
                    "Sign Up",
                    style: Theme_.ts0r,
                  ),
                  Text(
                    "Create account to get started.",
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
                  Container(
                    width: double.infinity,
                    child: GestureDetector(
                      onTap: controller.onSignInWithGoogle(),
                      child: SignInWithGoogle(),
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
                      Text('or'),
                      Expanded(
                          child: Divider(
                        thickness: 2,
                        indent: 15,
                        endIndent: 60,
                      )),
                    ],
                  ),
                  SizedBox(height: 15),
                  AssistoTextField(
                    hintText: "Email or Phone",
                    controller: controller.idController,
                    prefixIcon: SizedBox(
                        child: Center(child: FaIcon(FontAwesomeIcons.user)),
                        height: 25,
                        width: 25),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              width: double.infinity,
              child: GestureDetector(
                onTap: controller.onSendOTP(),
                child: SendOTPButton(),
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
                  Text("Already have an account? "),
                  TextButton(
                    onPressed: controller.onLogInPressed,
                    child: Text(
                      "Log in",
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

class SendOTPButton extends StatelessWidget {
  const SendOTPButton({Key? key}) : super(key: key);

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
          "Send OTP",
          style: Theme_.tS20white,
        ),
      ),
    );
  }
}
