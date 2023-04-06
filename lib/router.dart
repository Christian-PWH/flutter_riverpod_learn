import 'package:flutter/material.dart';
import 'package:flutter_riverpod_learn/author/screens/author_home.dart';
import 'package:flutter_riverpod_learn/common/widgets/error_screen.dart';
import 'package:flutter_riverpod_learn/splash/screens/splash_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    case AuthorHomeScreen.routeName:
      return MaterialPageRoute(builder: (context) => const AuthorHomeScreen());
    default:
      return MaterialPageRoute(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Page Not Found'),
            centerTitle: true,
          ),
          body: const ErrorScreen(text: 'This page does not exists'),
        );
      });
  }
}
