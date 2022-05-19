import 'package:flutter/material.dart';
import 'package:flutter_educa/screens/AnswerScreen.dart';
import 'package:flutter_educa/screens/AudioPlayerScreen.dart';
import 'package:flutter_educa/screens/AudiosScreen.dart';
import 'package:flutter_educa/screens/CourseScreen.dart';
import 'package:flutter_educa/screens/HomeScreen.dart';
import 'package:flutter_educa/screens/InicioScreen.dart';
import 'package:flutter_educa/screens/LecturasScreen.dart';
import 'package:flutter_educa/screens/LoginScreen.dart';
import 'package:flutter_educa/screens/QuizesScreen.dart';
import 'package:flutter_educa/screens/ReadLecturaScreen.dart';
import 'package:flutter_educa/screens/RecursosScreen.dart';
import 'package:flutter_educa/screens/VideosScreen.dart';

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
        return MaterialPageRoute(builder: (_) => const CourseScreen());
      case '/recursos':
        return MaterialPageRoute(builder: (_) => const RecursosScreen());
      case '/quizes':
        return MaterialPageRoute(builder: (_) => const QuizesScreen());
      case '/audios':
        return MaterialPageRoute(builder: (_) => const AudiosScreen());
      case '/lecturas':
        return MaterialPageRoute(builder: (_) => const LecturasScreen());
      case '/videos':
        return MaterialPageRoute(builder: (_) => const VideosScreen());
      case '/lectura_demo':
        return MaterialPageRoute(builder: (_) => ReadLecturaScreen(data: args));
      case '/audio_demo':
        return MaterialPageRoute(builder: (_) => const AudioPlayerScreen());
      case '/quiz_demo':
        return MaterialPageRoute(builder: (_) => const AnswerScreen());
      default:
        return MaterialPageRoute(builder: (_) => const InicioScreen());
    }
  }
}
