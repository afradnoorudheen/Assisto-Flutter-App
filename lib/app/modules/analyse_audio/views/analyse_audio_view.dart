import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/analyse_audio_controller.dart';

class AnalyseAudioView extends GetView<AnalyseAudioController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnalyseAudioController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('AnalyseAudioView'),
          centerTitle: true,
        ),
        body: Center(
          child: Text(
            'AnalyseAudioView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
    });
  }
}
