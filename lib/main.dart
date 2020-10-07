import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/repositories/user_data_repository.dart';
import 'package:flutter_challenge/utils/app_themes.dart';

import 'routes/route_generator.dart';
import 'routes/routes.dart';
import 'utils/themebloc/theme_bloc.dart';

void main() {
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
      ],
      child: _buildWithTheme(
        context,
        ThemeState(
          themeData: appThemeData[AppTheme.DarkTheme],
        ),
      ),
    );
  }

  Widget _buildWithTheme(BuildContext context, ThemeState state) {
    print('BG:: ${state.themeData.accentColor}');
    return MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child,
        );
      },
      title: 'Chuck Norris Jokes',
      initialRoute: Routes.splash,
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: state.themeData,
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
