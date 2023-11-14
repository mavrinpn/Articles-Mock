import 'package:flutter/material.dart';

class Settings extends ChangeNotifier {
  late ThemeMode themeMode;
  ThemeMode get getThemeMode => themeMode;
  void setTheme(ThemeMode newTheme) {
    themeMode = newTheme;
    notifyListeners();
  }

  init() async {
    themeMode = ThemeMode.light;
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
