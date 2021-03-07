import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData basicMaterialThemeData(bool isLightTheme) {
  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
      subtitle1: base.subtitle1?.copyWith(color: isLightTheme ? Colors.black : Colors.white),
        headline1: base.headline1
            ?.copyWith(color: isLightTheme ? Colors.black : Colors.white));
  }

  ThemeData _themeData = isLightTheme ? ThemeData.light() : ThemeData.dark();
  return _themeData.copyWith(
      textTheme: _basicTextTheme(_themeData.textTheme),
      primaryColor: isLightTheme ? Colors.green : Colors.black,
      secondaryHeaderColor: isLightTheme ? Colors.lightGreen : Colors.white);
}

CupertinoThemeData basicCupertinoThemeData(bool isLightTheme) {
  CupertinoTextThemeData _basicTextTheme(CupertinoTextThemeData base) {
    return base.copyWith(
        actionTextStyle: base.actionTextStyle.copyWith(color: Colors.blue),
        navLargeTitleTextStyle: base.navLargeTitleTextStyle
            .copyWith(color: isLightTheme ? Colors.black : Colors.white),
        navTitleTextStyle: base.navTitleTextStyle.copyWith(color: Colors.blue));
  }

  CupertinoThemeData _themeData = CupertinoThemeData();
  return _themeData.copyWith(
      primaryContrastingColor: isLightTheme ? Colors.white : Colors.black,
      brightness: isLightTheme ? Brightness.light : Brightness.dark,
      primaryColor: isLightTheme ? Colors.blue : Colors.white,
      barBackgroundColor: isLightTheme ? Colors.white : Colors.black,
      scaffoldBackgroundColor: isLightTheme ? Colors.white : Colors.black,
      textTheme: _basicTextTheme(_themeData.textTheme));
}
