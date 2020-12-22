import 'package:flutter/widgets.dart';

class ThemeSwitchProvider with ChangeNotifier {
  bool _themeState = false;

  bool get isLightTheme => _themeState;

  void updateAppTheme(bool themeState) {
    _themeState = themeState;
    notifyListeners();
  }
}
