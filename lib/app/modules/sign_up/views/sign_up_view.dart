import 'package:assisto/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
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
                        SignInWithGoogle(
                            onPressed: controller.onSignInWithGoogle),
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
                            hintText: "Phone",
                            controller: controller.phoneController,
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
                      onPressed: () {
                        Get.dialog(_buildOTPDialog());
                        controller.onSendOTP();
                      },
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
