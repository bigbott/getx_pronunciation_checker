import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pronunciation_checker/app/infrastructure/speech_recognition_service.dart';
import 'package:getx_pronunciation_checker/app/data/storage_service.dart';
import 'package:getx_pronunciation_checker/app/infrastructure/tts_service.dart';

class WalkthruController extends GetxController {
 final TextEditingController textController = TextEditingController();
  final TtsService ttsService;
  final SpeechRecognitionService speechRecognitionService;
  final IStorageService storageService;
  String feedback = '';
  String result = '';
  bool isRecording = false;

  get firstTime  => storageService.loadFirstTime();
  set firstTime (val)  => storageService.saveFirstTime(val); 

  WalkthruController({
    required this.ttsService,
    required this.speechRecognitionService,
    required this.storageService,
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

  void compareText(String recognizedText) async{
    print(recognizedText);
    String text = textController.text.trim().toLowerCase().replaceAll(RegExp(r'(\?|\.|\!|\,)'), '');
    if (recognizedText.trim().toLowerCase() == text) {
      feedback = 'Excellent';
    } else {
      feedback = 'Try again';
    }
    await Future.delayed(Duration(seconds: 1));
    update(['feedback']);
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}
