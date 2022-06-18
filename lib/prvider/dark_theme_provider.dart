import 'package:flutter/cupertino.dart';
import 'package:grocery_app/services/dark_theme_prefs.dart';

class DarkThemeProvider with ChangeNotifier {
  bool _darkTheme = false;
  DarkThemePrefs darkThemePrefs = DarkThemePrefs();
  bool get getDarkTheme => _darkTheme;
  set setDarkTheme(bool value) {
    _darkTheme = value;
    darkThemePrefs.setDarkTheme(value);
    notifyListeners();
  }
}
