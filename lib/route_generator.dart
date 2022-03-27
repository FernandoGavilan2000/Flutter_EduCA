import 'package:flutter/material.dart';
import 'package:flutter_educa/screens/CourseScreen.dart';
import 'package:flutter_educa/screens/HomeScreen.dart';
import 'package:flutter_educa/screens/InicioScreen.dart';
import 'package:flutter_educa/screens/LoginScreen.dart';
import 'package:flutter_educa/screens/RecursosScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final dynamic args = settings.arguments;
    //print(args);
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const InicioScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/course':
        return MaterialPageRoute(builder: (_) => CourseScreen(data: args));
      case '/recursos':
        return MaterialPageRoute(builder: (_) => const RecursosScreen());
      default:
        return MaterialPageRoute(builder: (_) => const InicioScreen());
    }
  }
}
