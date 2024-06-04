import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/themes/dark_mode.dart';
import 'package:flutter_food_delivery/themes/light_mode.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode; // Tema default

  ThemeData get themeData => _themeData; // Pembaca (getter) untuk themeData

  bool get isDarkMode => _themeData == darkMode; // Periksa apakah tema saat ini gelap

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners(); // Beri tahu pendengar tentang perubahan
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
