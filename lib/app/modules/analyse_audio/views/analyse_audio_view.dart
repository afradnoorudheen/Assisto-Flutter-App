import 'package:assisto/app/modules/login/views/login_view.dart';
import 'package:assisto/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'package:get/get.dart';

import '../../../widgets/textField.dart';
import '../controllers/analyse_audio_controller.dart';

class AnalyseAudioView extends GetView<AnalyseAudioController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnalyseAudioController>(builder: (_) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            height: Get.height,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: AImg(
                        name: 'assisto_mini',
                        height: 50,
                        width: 135,
                      ),
                    ),
                    _buildUi(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildInitalUi() {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        buildTextField(),
        SizedBox(
          height: 35,
        ),
        Text(
          'Upload the Call Recording',
          style: Theme_.ts4s.copyWith(color: Theme_.greyED),
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: controller.pickAudio,
          child: SizedBox(
            width: 150,
            child: WhiteButton(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AImg(
                      name: 'upload',
                      height: 18,
                      width: 18,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Upload',
                      style: Theme_.ts4rBlue,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0xFF000000).withOpacity(0.10),
          blurRadius: 59,
          offset: Offset(0, 4),
        ),
      ]),
      child: TextField(
        keyboardType: TextInputType.phone,
        controller: controller.phoneController,
        decoration: InputDecoration(
          filled: true,
          prefixText: '+91',
          prefixStyle: Theme_.ts4r,
          suffixIcon: MaterialButton(
              minWidth: 70,
              height: 20,
              color: Theme_.aBlue,
              shape: CircleBorder(),
              onPressed: () async {
                await FlutterPhoneDirectCaller.callNumber(
                    controller.phoneController.text);
              },
              child: Icon(
                controller.state == States.success ? Icons.done : Icons.phone,
                color: Colors.white,
              )),
          hintText: 'Phone Number',
          hintStyle: Theme_.ts5rGreyL,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Theme_.aBlue, width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.white, width: 0),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        ),
        style: Theme_.ts4r.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildReactionUi() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Call Summary',
                  style: Theme_.ts4s.copyWith(
                    color: Theme_.aBlue,
                    fontFamily: Theme_.aFontFamilyAlt,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 40),
              height: 40,
              width: 40,
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                  color: Color(0xFFCCD2DA),
                  borderRadius: BorderRadius.all(Radius.circular(12))),
            ),
          ],
        ),
        buildTextField(),
        Column(
          children: [
            Text(
              'Call : 2 Min 30 Sec',
              style: Theme_.ts5sGreyD
                  .copyWith(fontFamily: Theme_.aFontFamilyAlt, fontSize: 22),
            ),
            SizedBox(height: 10),
            Text(
              '#CUS- 125',
              style: Theme_.ts5sGrey.copyWith(
                fontFamily: Theme_.aFontFamilyAlt,
              ),
            ),
          ],
        ),
        buildEmotionUi(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: controller.callAgain,
              child: Container(
                height: 55,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF000000).withOpacity(0.10),
                        blurRadius: 40,
                        offset: Offset(0, 3),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Row(
                  children: [
                    AImg(
                      name: 'repeat',
                      height: 18,
                      width: 18,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Call Again',
                      style: Theme_.ts5rBlue,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              height: 55,
              width: 55,
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                  color: Theme_.aBlue,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            'This Call Summary will be recorded for Future Analysis.',
            style: Theme_.ts5rGreyD,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget buildEmotionUi() {
    late String emotion;
    late Color color;
    switch (controller.emotion) {
      case 'calm':
        emotion = 'Smiley_Calm';
        color = Color(0xFFEFC120);
        break;
      case 'disgust':
        emotion = "Smiley_Disgust";
        color = Theme_.red;
        break;
      case 'happy':
        emotion = "Smiley_Happy";
        color = Color(0xFF7CBC2B);
        break;
      case 'fearful':
        emotion = "Smiley_Fearful";
        color = Color(0xFFEA8C00);
        break;
    }
    return Column(
      children: [
        AImg(
          name: emotion,
          height: 175,
          width: 175,
        ),
        Text(
          '${controller.emotion}!',
          style: Theme_.ts1s.copyWith(color: color),
        )
      ],
    );
  }

  Widget _buildUi() {
    if (controller.state == States.inital)
      return _buildInitalUi();
    else if (controller.state == States.loading)
      return Center(
        child: CircularProgressIndicator(),
      );
    else if (controller.state == States.success)
      return Expanded(child: _buildReactionUi());
    else
      return Text('Error');
  }
}
