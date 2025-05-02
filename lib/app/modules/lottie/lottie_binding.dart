import 'package:get/get.dart';
import 'package:getx_pronunciation_checker/app/infrastructure/share_service.dart';
import 'package:getx_pronunciation_checker/app/infrastructure/speech_recognition_service.dart';
import 'package:getx_pronunciation_checker/app/infrastructure/tts_service.dart';

import 'lottie_controller.dart';

class LottieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LottieController>(() => LottieController(
          ttsService: Get.find<ITtsService>(),
          speechRecognitionService: Get.find<ISpeechRecognitionService>(),
          shareService: Get.find<IShareService>(),
        ));
  }
}
