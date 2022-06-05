import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as d;

enum States { inital, loading, success, failed }

class AnalyseAudioController extends GetxController {
  FilePickerResult? fileResult;
  String? emotion;
  States state = States.inital;

  TextEditingController phoneController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    // pickAudio();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> pickAudio() async {
    state = States.loading;
    update();
    fileResult = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['wav']);
    await analyseAudio();
  }

  analyseAudio() async {
    if (fileResult != null) {
      var formData = d.FormData.fromMap({
        'audio': await d.MultipartFile.fromFile(
          fileResult!.files[0].path!,
        )
      });

      final x = await d.Dio()
          .post('http://192.168.1.7:8000/analyse/', data: formData);
      if (x.statusCode == 200) {
        state = States.success;
        update();
        emotion = x.data["emotion"][0];
        writeToFIrestore();
      }
    }
  }

  callAgain() {
    emotion = null;
    phoneController.text = '';
    state = States.inital;
    update();
  }

  writeToFIrestore() {
    FirebaseFirestore.instance.collection('reports').add({
      'emotion': emotion,
      'phone': phoneController.text,
      'datetime': Timestamp.fromDate(DateTime.now())
    });
  }
}
