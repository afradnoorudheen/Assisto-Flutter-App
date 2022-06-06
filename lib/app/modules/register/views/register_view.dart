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
        leading: IconButton(
          icon: FaIcon(
            FontAwesomeIcons.chevronLeft,
            color: Theme_.aBlue,
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        width: double.infinity,
        color: Theme_.pageBg,
        child:
            ListView(padding: EdgeInsets.symmetric(horizontal: 30), children: [
          Text(
            "Sign Up",
            style: Theme_.ts0r.copyWith(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10),
          Text(
            "Complete your registration!",
            style: Theme_.ts2r.copyWith(color: Theme_.greyEL),
          ),
          SizedBox(height: 50),
          Container(
            // margin: EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            child: Column(
              children: [
                AssistoTextField(
                  hintText: "First Name",
                  controller: controller.firstNameController,
                  prefixIcon: SizedBox(
                      child: Center(
                          child:
                              ImageIcon(AssetImage("assets/images/user.png"))),
                      height: 25,
                      width: 25),
                ),
                textFieldSpacing(),
                AssistoTextField(
                  hintText: "Last Name",
                  controller: controller.lastNameController,
                  prefixIcon: SizedBox(
                      child: Center(
                          child:
                              ImageIcon(AssetImage("assets/images/user.png"))),
                      height: 25,
                      width: 25),
                ),
                textFieldSpacing(),
                AssistoTextField(
                  hintText: "Mail ID",
                  controller: controller.mailIDController,
                  prefixIcon: SizedBox(
                      child: Center(
                          child: FaIcon(
                        FontAwesomeIcons.envelope,
                        color: Theme_.grey,
                      )),
                      height: 25,
                      width: 25),
                ),
                textFieldSpacing(),
                AssistoTextField(
                  hintText: "DOB",
                  controller: controller.dobController,
                  prefixIcon: SizedBox(
                      child: Center(
                          child: ImageIcon(
                        AssetImage("assets/images/calendar-alt.png"),
                        color: Theme_.grey,
                      )),
                      height: 25,
                      width: 25),
                ),
                textFieldSpacing(),
                AssistoTextField(
                  hintText: "Gender",
                  controller: controller.genderController,
                  prefixIcon: SizedBox(
                      child: Center(
                          child: FaIcon(
                        FontAwesomeIcons.venusMars,
                        color: Theme_.grey,
                      )),
                      height: 25,
                      width: 25),
                ),
                textFieldSpacing(),
                AssistoTextField(
                  hintText: "Google ID",
                  controller: controller.googleIDController,
                  prefixIcon: SizedBox(
                      child: Center(
                          child: FaIcon(
                        FontAwesomeIcons.google,
                        color: Theme_.grey,
                      )),
                      height: 25,
                      width: 25),
                ),
                textFieldSpacing(),
                Container(
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: controller.onCompletePressed,
                    child: LoginButton(),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  SizedBox textFieldSpacing() {
    return SizedBox(height: 15);
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
          "COMPLETE",
          style: Theme_.ts3r
              .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
