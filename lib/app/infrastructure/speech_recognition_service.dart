import 'package:speech_to_text/speech_to_text.dart' as stt;

abstract interface class ISpeechRecognitionService {
    String get recognizedText;
    bool get isListening;
    Future<void> startListening();
    void stopListening();
}  

class SpeechRecognitionService implements ISpeechRecognitionService{
  final stt.SpeechToText _speech = stt.SpeechToText();
  String _recognizedText = '';
  @override
  String get recognizedText => _recognizedText;
  bool _isListening = false;
  @override
  bool get isListening => _isListening;

  @override
  Future<void> startListening() async {
    bool available = await _speech.initialize();
    if (available) {
      _isListening = true;
      await _speech.listen(onResult: (result) {
        _recognizedText = result.recognizedWords;
      });
    }
  }

  @override
  void stopListening() {
    _speech.stop();
    _isListening = false;
  }

  
}
