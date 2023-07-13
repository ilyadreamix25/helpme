import 'package:flutter/cupertino.dart';
import 'package:helpme/core/screens/about_screen.dart';
import 'package:helpme/core/screens/start_screen.dart';
import 'package:helpme/home/home_screen.dart';
import 'package:helpme/signin/signin_screen.dart';
import 'package:helpme/signup/signup_screen.dart';
import 'package:helpme/core/utils/log_util.dart';

class HelpMeNavigation {
  static const String startRoute = 'start';
  static const String homeRoute = 'home';
  static const String chatRoute = 'chat';
  static const String signUpRoute = 'sign-up';
  static const String signInRoute = 'sign-in';
  static const String aboutRoute = 'about';

  static Widget _findRouteWidget(RouteSettings routeSettings) {
    final arguments = routeSettings.arguments as Map<String, dynamic>?;

    LogUtility.info(
      tag: 'HelpMeNavigation._findRouteWidget',
      message: 'Navigate to ${routeSettings.name}'
    );

    switch (routeSettings.name) {
      case startRoute:
        return const StartScreen();
      case aboutRoute:
        return const AboutScreen();
      case signUpRoute:
        return SignUpScreen(useApple: arguments?['useApple']);
      case signInRoute:
        return SignInScreen(useApple: arguments?['useApple']);
      case homeRoute:
        return const HomeScreen();
      default:
        throw UnimplementedError();
    }
  }

  static Route generateRoute(RouteSettings routeSettings) {
    return CupertinoPageRoute(
      builder: (_) => _findRouteWidget(routeSettings),
    );
  }
}
