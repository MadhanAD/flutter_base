import 'package:flutter/foundation.dart';

class ApiUrl {
  static String get baseUrl {
    if (kReleaseMode) {
      return "production url goes here";
    } else {
      return "dev utl goes here";
    }
  }

  static String get GET_PROFILE => baseUrl + "user";
}
