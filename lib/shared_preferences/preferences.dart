import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _preferences;

  static bool _darkMode = false;
  static String _name = '';
  static int _gender = 1;

  static Future init() async => _preferences = await SharedPreferences.getInstance();

  static bool get darkMode => _preferences.getBool('darkMode') ?? _darkMode;
  static set darkMode(bool value) {
    _darkMode = value;
    _preferences.setBool('darkMode', value);
  }

  static String get name => _preferences.getString('name') ?? _name;
  static set name(String value) {
    _name = value;
    _preferences.setString('name', value);
  }

  static int get gender => _preferences.getInt('gender') ?? _gender;
  static set gender(int value) {
    _gender = value;
    _preferences.setInt('gender', value);
  }
}
