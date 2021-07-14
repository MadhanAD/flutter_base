import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/appProviders/ThemeSwitchProvider.dart';
import 'package:flutter_base_app/appUtility/AppTheme.dart';
import 'package:flutter_base_app/screens/android/HomeScreen.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = "publishable key";
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ThemeSwitchProvider())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeSwitchProvider>(
        builder: (context, themeProvider, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: basicMaterialThemeData(themeProvider.isLightTheme),
              home: HomeScreen(title: "Flutter Stripe Demo"),
            ));
  }
}
