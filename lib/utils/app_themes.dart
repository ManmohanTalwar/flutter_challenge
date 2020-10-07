import 'package:flutter/material.dart';
import 'package:flutter_challenge/utils/app_constants.dart';

enum AppTheme {
  LightTheme,
  DarkTheme,
}

final appThemeData = {
  AppTheme.LightTheme: ThemeData.light().copyWith(
    primaryColor: Color(0xfff5f5f5),
    accentColor: AppConstants.orangeBg,
    textTheme: TextTheme(
      headline1: AppConstants.headlineLight(24.0),
      headline2: AppConstants.headlineLight(22.0),
      headline3: AppConstants.headlineLight(20.0),
      headline4: AppConstants.headlineLight(18.0),
      headline5: AppConstants.headlineLight(16.0),
      headline6: AppConstants.headlineLight(16.0),
      subtitle1: AppConstants.subtitleLight(14.0),
      subtitle2: AppConstants.subtitleLight(12.0),
      bodyText1: AppConstants.body1Light,
      bodyText2: AppConstants.body2Light,
    ),
    appBarTheme: AppBarTheme(
      color: Color(0xfff5f5f5),
      actionsIconTheme: IconThemeData(color: Colors.white),
    ),
  ),
  AppTheme.DarkTheme: ThemeData.dark().copyWith(
    primaryColor: Color(0xff1f655d),
//    accentColor: Color(0xff40bf7a),
    accentColor: AppConstants.blueBg,
    scaffoldBackgroundColor: AppConstants.appBackground,
    backgroundColor: AppConstants.appBackground,
    bottomAppBarColor: AppConstants.bottomBarColor,
    textTheme: TextTheme(
      headline1: AppConstants.headlineDark(24.0),
      headline2: AppConstants.headlineDark(22.0),
      headline3: AppConstants.headlineDark(20.0),
      headline4: AppConstants.headlineDark(18.0),
      headline5: AppConstants.headlineDark(16.0),
      headline6: AppConstants.headlineDark(16.0),
      subtitle1: AppConstants.subtitleDark(14.0),
      subtitle2: AppConstants.subtitleDark(12.0),
      bodyText1: AppConstants.body1Dark,
      bodyText2: AppConstants.body2Light,
    ),
    appBarTheme: AppBarTheme(
      color: Color(0xff1f655d),
    ),
  ),
};
