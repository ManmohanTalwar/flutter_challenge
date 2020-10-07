import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/config/pref_manager.dart';
import 'package:flutter_challenge/pages/initial_page.dart';
import 'package:flutter_challenge/utils/app_constants.dart';

import '../utils/app_themes.dart';
import '../utils/themebloc/theme_bloc.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(milliseconds: 1000),
      () => {
        _loadScreen(),
      },
    );
  }

  _loadScreen() async {
    await Prefs.load();
    context.bloc<ThemeBloc>().add(
          ThemeChanged(
            theme: Prefs.getBool(
              Prefs.DARKTHEME,
              def: true,
            )
                ? AppTheme.DarkTheme
                : AppTheme.LightTheme,
          ),
        );

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => InitialPage(),
        settings: RouteSettings(name: "/initialPage"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstants.white,
        body: Column(
          children: <Widget>[
            Spacer(),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Image.asset('assets/images/jokes.png'),
            ),
            Text(
              'JOKES',
              style: AppConstants.customStyleSpacing(
                color: AppConstants.black,
                style: FontStyle.italic,
                letterSpace: 3.0,
                size: 18.0,
                weight: FontWeight.w400,
              ),
            ),
            Spacer(),
            Container(
              width: 150,
              height: 2,
              child: LinearProgressIndicator(
                backgroundColor: AppConstants.white,
                valueColor:
                    AlwaysStoppedAnimation<Color>(AppConstants.primaryColor),
              ),
            ),
            Spacer(),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              alignment: Alignment.center,
              child: Text(
                'v1.0.0',
                style: AppConstants.customStyle(
                  weight: FontWeight.w400,
                  size: 12.0,
                  style: FontStyle.normal,
                  color: AppConstants.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
