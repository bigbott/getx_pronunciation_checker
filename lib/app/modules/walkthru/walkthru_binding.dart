import 'package:get/get.dart';
import 'package:getx_pronunciation_checker/app/data/speech_recognition.dart';
import 'package:getx_pronunciation_checker/app/data/storage_service.dart';
import 'package:getx_pronunciation_checker/app/data/tts_service.dart';

import 'walkthru_controller.dart';

class WalkthruBinding extends Bindings {
  @override
  void dependencies() {
   
    Get.lazyPut<WalkthruController>(
      () => WalkthruController(
        ttsService: TtsService(),
        speechRecognitionService: SpeechRecognitionService(),
        storageService: Get.find<IStorageService>(),
      ),
    );
  }
}
