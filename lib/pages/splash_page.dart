import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/config/pref_manager.dart';
import 'package:flutter_challenge/pages/initial_page.dart';

import '../utils/app_themes.dart';
import '../utils/constants.dart';
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
        body: Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(),
              ),
              Container(
                width: 150,
                height: 2,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.blue.shade400,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                alignment: Alignment.center,
                child: Text(
                  'v1.0.0',
                  style: kTextStyleSubtitle1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
