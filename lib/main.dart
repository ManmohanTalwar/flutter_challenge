import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/blocs/JokesBloc.dart';
import 'package:flutter_challenge/config/Locale/locales.dart';
import 'package:flutter_challenge/repositories/user_data_repository.dart';
import 'package:flutter_challenge/utils/app_themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'routes/route_generator.dart';
import 'routes/routes.dart';
import 'utils/themebloc/theme_bloc.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserDataRepository userDataRepository = UserDataRepository();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc(
            ThemeState(
              themeData: appThemeData[AppTheme.DarkTheme],
            ),
          ),
          child: BlocBuilder<ThemeBloc, ThemeState>(
            builder: _buildWithTheme,
          ),
        ),
        BlocProvider(
          create: (context) => JokesBloc(
            userDataRepository: UserDataRepository(),
          ),
        ),
      ],
      child: _buildWithTheme(
        context,
        ThemeState(
          themeData: appThemeData[AppTheme.LightTheme],
        ),
      ),
    );
  }

  Widget _buildWithTheme(BuildContext context, ThemeState state) {
    return MaterialApp(
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        // GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
      ],
      builder: (context, child) {
        return child;
      },
      title: 'Chuck Norris Jokes',
      initialRoute: Routes.splash,
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: state.themeData,
    );
  }
}
