import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences _sharedPrefs;

  init() async {
    if (_sharedPrefs == null) {
      _sharedPrefs = await SharedPreferences.getInstance();
    }
  }

  int get animal => _sharedPrefs.getInt(animalCtr) ?? 0;

  set animal(int value) {
    _sharedPrefs.setInt(animalCtr, value);
  }

  int get color => _sharedPrefs.getInt(colorCtr) ?? 0;

  set color(int value) {
    _sharedPrefs.setInt(colorCtr, value);
  }
}

final sharedPrefs = SharedPrefs();
// constants/strings.dart
const String animalCtr = "animals counter";
const String colorCtr = "colors counter";
