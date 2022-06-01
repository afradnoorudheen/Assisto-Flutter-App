import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as d;

class AnalyseAudioController extends GetxController {
  FilePickerResult? fileResult;
  @override
  void onInit() {
    super.onInit();
    pickAudio();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> pickAudio() async {
    fileResult = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['wav']);
    analyseAudio();
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
        Get.dialog(Dialog(child: Text(x.data["emotion"][0])));
      }
    }
  }
}
