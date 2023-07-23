import 'package:flutter/material.dart';
import 'package:pr_5_sky_scrapper/prefs/theme_preference.dart';

class ThemeProvider extends ChangeNotifier {

  late bool _isDark;
  late ThemePrefs _prefs;
  bool get isDark => _isDark;

  ThemeProvider() {
    _isDark = false;
    _prefs = ThemePrefs();
    getPrefs;
  }

  set isDark(bool value) {
    _isDark = value;
    _prefs.setTheme(value);
    notifyListeners();
  }

  getPrefs() async {
    _isDark = await _prefs.getTheme();
    notifyListeners();
  }

}