import 'package:shared_preferences/shared_preferences.dart';

abstract interface class IStorageService {
  bool loadFirstTime();
  void saveFirstTime(bool val);
}

class StorageService implements IStorageService {
  late SharedPreferences _prefs;

  StorageService() {
    _init();
  }

  void _init() async {
    _prefs = await SharedPreferences.getInstance();
  }


  @override
  bool loadFirstTime() {
    return _prefs.getBool('firstTime') ?? true;
  }

  @override
  void saveFirstTime(bool val) {
    _prefs.setBool('firstTime', val);
  }
}
