import 'package:flutter_tts/flutter_tts.dart';

abstract interface class ITtsService {
  Future<void> speak(String text);
}

class TtsService implements ITtsService{
  final FlutterTts _flutterTts = FlutterTts();

  @override
  Future<void> speak(String text) async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setSpeechRate(0.5);
    await _flutterTts.speak(text);
  }
}
