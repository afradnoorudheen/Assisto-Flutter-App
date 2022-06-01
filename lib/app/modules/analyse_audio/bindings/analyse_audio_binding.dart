import 'package:get/get.dart';

import '../controllers/analyse_audio_controller.dart';

class AnalyseAudioBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnalyseAudioController>(
      () => AnalyseAudioController(),
    );
  }
}
