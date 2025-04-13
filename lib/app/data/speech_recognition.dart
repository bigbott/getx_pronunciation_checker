import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechRecognitionService {
  final stt.SpeechToText _speech = stt.SpeechToText();
  String _recognizedText = '';
  bool isListening = false;

  Future<void> startListening() async {
    bool available = await _speech.initialize();
    if (available) {
      isListening = true;
      await _speech.listen(onResult: (result) {
        _recognizedText = result.recognizedWords;
      });
    }
  }

  void stopListening() {
    _speech.stop();
    isListening = false;
  }

  String get recognizedText => _recognizedText;
}
