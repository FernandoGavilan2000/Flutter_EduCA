import 'package:flutter/cupertino.dart';

class QuizzProvider extends ChangeNotifier {
  String courseName;
  List<String>? goals;

  QuizzProvider({
    this.courseName = '',
  });

  void changeCourse(String newCourse, List<String> newgoals) {
    courseName = newCourse;
    goals = newgoals;
    notifyListeners();
  }
}
