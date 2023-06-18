import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;
  ThemeData _currenteTheme;

  bool get darkTheme => this._darkTheme;
  bool get customtheme => this._customTheme;
  ThemeData get currenteTheme => this._currenteTheme;

  ThemeChanger(int theme) {
    switch (theme) {
      case 1: //? para cuando es el light
        _darkTheme = false;
        _customTheme = false;
        _currenteTheme = ThemeData.light();
        break;
      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currenteTheme = ThemeData.dark().copyWith(accentColor: Colors.pink);
        break;
      case 3:
        _darkTheme = false;
        _customTheme = false;

        break;
      default:
        _darkTheme = false;
        _customTheme = false;
        _currenteTheme = ThemeData.light();
    }
  }

  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;
    notifyListeners();
    if (value) {
      _currenteTheme = ThemeData.dark();
    } else {
      _currenteTheme = ThemeData.light();
    }
  }

  set customtheme(bool value) {
    _customTheme = value;
    _darkTheme = false;
    notifyListeners();
    if (value) {
      _currenteTheme = ThemeData.dark().copyWith(
          accentColor: Color(0xff48a0eb),
          primaryColorLight: Colors.white,
          scaffoldBackgroundColor: Color(0xff16202b),
          textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)));
    } else {
      _currenteTheme = ThemeData.light();
    }
  }
}
