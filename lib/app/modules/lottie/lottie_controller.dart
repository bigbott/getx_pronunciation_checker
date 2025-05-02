import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pronunciation_checker/app/common/ticker/simple_ticker_provider.dart';
import 'package:getx_pronunciation_checker/app/infrastructure/share_service.dart';
import 'package:getx_pronunciation_checker/app/infrastructure/speech_recognition_service.dart';
import 'package:getx_pronunciation_checker/app/infrastructure/tts_service.dart';
import 'package:getx_pronunciation_checker/app/modules/lottie/widgets/share_dialog.dart';

class LottieController extends GetxController {
  final TextEditingController textController = TextEditingController();
  final ITtsService ttsService;
  final ISpeechRecognitionService speechRecognitionService;
  final IShareService shareService;
  String feedback = '';
  String result = '';
  bool isRecording = false;
  bool showConfetti = true;

  int wordsCount = 0;

  final AnimationController animController =
      AnimationController(vsync: SimpleTickerProvider());

  LottieController({
    required this.ttsService,
    required this.speechRecognitionService,
    required this.shareService,
  });

  void playText() {
    final text = textController.text;
    ttsService.speak(text);
  }

  void startRecording() {
    speechRecognitionService.startListening();
    feedback = '';
    result = '';
    isRecording = true;
    update();
    update(['feedback']);
  }

  void stopRecording() {
    speechRecognitionService.stopListening();
    compareText(speechRecognitionService.recognizedText);
    result = speechRecognitionService.recognizedText;
    isRecording = false;
    update();
  }

  void compareText(String recognizedText) async {
    print(recognizedText);
    String text =
        textController.text.trim().toLowerCase().replaceAll(RegExp(r'(\?|\.|\!|\,)'), '');
    if (recognizedText.trim().toLowerCase() == text) {
      feedback = 'Excellent';
      await Future.delayed(Duration(seconds: 1));
      update(['feedback']);
      countWords();
    } else {
      feedback = 'Try again';
      await Future.delayed(Duration(seconds: 1));
      update(['feedback']);
    }
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }

  Future<void> countWords() async {
    wordsCount += textController.text.split(' ').length;
    if (wordsCount >= 10) {
      Get.dialog(ShareDialog(
        onMaybeLater: Get.back,
        onShare: () async {
          Get.back();
          bool result = await shareService
              .share('I checked 10 words pronunciation with Pronunciation Checker '
                  'https://pronunciationchecker.app');
          if (result) {
            Get.showSnackbar(GetSnackBar(
              message: 'Thanks for sharing',
            ));
          }
        },
      ));
      showConfetti = true;
      await Future.delayed(Duration(milliseconds: 3000));
      showConfetti = false;
      update(['confetti']);
    }
  }

  void onAnimationComplete() {
    showConfetti = false;
    update(['confetti']);
  }
}
