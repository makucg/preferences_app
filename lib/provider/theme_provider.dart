import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData;

  ThemeProvider({bool darkMode = false}) : _themeData = darkMode ? ThemeData.dark() : ThemeData.light();

  get currentTheme => _themeData;

  setLightTheme() {
    _themeData = ThemeData.light();
    notifyListeners();
  }

  setDarkTheme() {
    _themeData = ThemeData.dark();
    notifyListeners();
  }
}
