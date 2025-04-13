import 'package:get/get.dart';
import 'package:getx_pronunciation_checker/app/data/speech_recognition.dart';
import 'package:getx_pronunciation_checker/app/data/tts_service.dart';

import 'pronunciation_checker_controller.dart';

class PronunciationCheckerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PronunciationCheckerController>(() => PronunciationCheckerController(
          ttsService: TtsService(),
          speechRecognitionService: SpeechRecognitionService(),));
  }
}
