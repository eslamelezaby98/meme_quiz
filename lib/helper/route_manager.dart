import 'package:flutter/material.dart';
import 'package:meme_quiz/views/main_screen.dart';
import 'package:meme_quiz/views/result_screen.dart';

class Routes {
  static const String mainScreen = '/';
  static const String resultScreen = '/resultScreen';
}

class RouteGenerator {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.mainScreen:
        return MaterialPageRoute(
          builder: (context) =>const MainScreen(),
        );
      case Routes.resultScreen:
        return MaterialPageRoute(
          builder: (context) =>const ResultScreen(),
        );
      default:
        undefindRoute();
    }
  }

  static undefindRoute() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('undefindRoute'),
      ),
      body: const Center(
        child: Text('undefindRoute'),
      ),
    );
  }
}
