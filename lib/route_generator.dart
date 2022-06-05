import 'package:flutter/material.dart';
import 'package:flutter_educa/screens/AnswerScreen.dart';
import 'package:flutter_educa/screens/AudioPlayerScreen.dart';
import 'package:flutter_educa/screens/AudiosScreen.dart';
import 'package:flutter_educa/screens/CourseScreen.dart';
import 'package:flutter_educa/screens/HomeScreen.dart';
import 'package:flutter_educa/screens/InicioScreen.dart';
import 'package:flutter_educa/screens/LecturasScreen.dart';
import 'package:flutter_educa/screens/LoginScreen.dart';
import 'package:flutter_educa/screens/ProfileUserScreen.dart';
import 'package:flutter_educa/screens/QuizzesScreen.dart';
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
      case '/profile':
        return MaterialPageRoute(builder: (_) => const ProfileUserScreen());
      case '/recursos':
        return MaterialPageRoute(builder: (_) => const RecursosScreen());
      case '/quizzes':
        return MaterialPageRoute(builder: (_) => QuizzesScreen(course: args));
      case '/audios':
        return MaterialPageRoute(builder: (_) => const AudiosScreen());
      case '/lecturas':
        return MaterialPageRoute(builder: (_) => LecturasScreen(course: args));
      case '/videos':
        return MaterialPageRoute(builder: (_) => VideosScreen(course: args));
      case '/lectura_demo':
        return MaterialPageRoute(builder: (_) => ReadLecturaScreen(data: args));
      case '/audio_demo':
        return MaterialPageRoute(builder: (_) => AudioPlayerScreen(data: args));
      case '/quiz_demo':
        return MaterialPageRoute(
            builder: (_) => AnswerScreen(
                  quizzID: args['quizzID'],
                  coursePath: args['coursePath'],
                ));
      default:
        return MaterialPageRoute(builder: (_) => const InicioScreen());
    }
  }
}
