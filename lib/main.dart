import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/appProviders/ThemeSwitchProvider.dart';
import 'package:flutter_base_app/appUtility/AppTheme.dart';
import 'package:flutter_base_app/screens/android/HomeScreen.dart';
import 'package:flutter_base_app/screens/ios/HomeScreenIos.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeSwitchProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeSwitchProvider>(
        builder: (context, themeProvider, child) => Platform.isAndroid
            ? MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: basicMaterialThemeData(themeProvider.isLightTheme),
                home: HomeScreen(title: "Flutter Android Home Page"),
              )
            : CupertinoApp(
                debugShowCheckedModeBanner: false,
                theme: basicCupertinoThemeData(themeProvider.isLightTheme),
                home: HomeScreenIos(
                  title: "Flutter IOS Home Page",
                ),
              ));
  }
}
