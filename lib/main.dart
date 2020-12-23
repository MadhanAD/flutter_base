import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/appProviders/ThemeSwitchProvider.dart';
import 'package:flutter_base_app/appUtility/AppTheme.dart';
import 'package:flutter_base_app/screens/android/HomeScreen.dart';
import 'package:flutter_base_app/screens/ios/HomeScreenIos.dart';
import 'package:provider/provider.dart';

import 'components/ResposiveWidget.dart';

void main() {
  runApp(DevicePreview(
    builder: (context) => MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => ThemeSwitchProvider())
    ], child: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeSwitchProvider>(
        builder: (context, themeProvider, child) => Platform.isAndroid
            ? MaterialApp(
                locale: DevicePreview.locale(context),
                builder: DevicePreview.appBuilder,
                debugShowCheckedModeBanner: false,
                theme: basicMaterialThemeData(themeProvider.isLightTheme),
                home: ResponsiveWidget(
                  mobileView: HomeScreen(title: "Flutter Android Home Page"),
                  tabletView: HomeScreen(title: "FLutter app for tablet"),
                ),
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
