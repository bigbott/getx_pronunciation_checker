import 'package:get/get.dart';
import 'package:getx_pronunciation_checker/app/infrastructure/share_service.dart';
import 'package:getx_pronunciation_checker/app/infrastructure/speech_recognition_service.dart';
import 'package:getx_pronunciation_checker/app/infrastructure/tts_service.dart';
import 'package:getx_pronunciation_checker/app/modules/share/share_controller.dart';

class ShareBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShareController>(() => ShareController(
          ttsService: Get.find<ITtsService>(),
          speechRecognitionService: Get.find<ISpeechRecognitionService>(),
          shareService: Get.find<IShareService>(),
        ));
  }
}
