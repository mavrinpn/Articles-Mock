import 'package:flutter/material.dart';

class Settings extends ChangeNotifier {
  late ThemeMode _themeMode;
  ThemeMode get getThemeMode => _themeMode;
  void setTheme(ThemeMode newTheme) {
    _themeMode = newTheme;
    notifyListeners();
  }

  init() async {
    _themeMode = ThemeMode.light;
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
