import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension Hex on Color {
  /// Return true if given Color is dark
  bool isDark() => getBrightness() < 128.0;

  /// Return true if given Color is light
  bool isLight() => !isDark();

  /// Returns Brightness of give Color
  double getBrightness() => (red * 299 + green * 587 + blue * 114) / 1000;

  /// Returns Luminance of give Color
  double getLuminance() => computeLuminance();
}

Future<void> setStatusBarColor(
  Color statusBarColor, {
  Color? systemNavigationBarColor,
  Brightness? statusBarBrightness,
  Brightness? statusBarIconBrightness,
  int delayInMilliSeconds = 200,
}) async {
  await Future.delayed(Duration(milliseconds: delayInMilliSeconds));

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: statusBarColor,
      systemNavigationBarColor: systemNavigationBarColor,
      statusBarBrightness: statusBarBrightness,
      statusBarIconBrightness: statusBarIconBrightness ??
          (statusBarColor.isDark() ? Brightness.light : Brightness.dark),
    ),
  );
}
