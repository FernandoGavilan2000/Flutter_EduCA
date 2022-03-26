import 'package:flutter/material.dart';
import 'package:flutter_educa/screens/HomeScreen.dart';
import 'package:flutter_educa/screens/InicioScreen.dart';
import 'package:flutter_educa/screens/LoginScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => InicioScreen());
        break;
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
        break;
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
        break;
      default:
        return MaterialPageRoute(builder: (_) => InicioScreen());
    }
  }
}
