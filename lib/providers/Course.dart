import 'package:flutter/material.dart';

class CourseProvider extends ChangeNotifier {
  String courseName;
  String coursePath;
  List<String>? goals;

  CourseProvider({
    this.courseName = '',
    this.coursePath = '',
  });

  void changeCourse(
      String newCourseName, String newCoursePath, List<String> newgoals) {
    courseName = newCourseName;
    coursePath = newCoursePath;
    goals = newgoals;
    notifyListeners();
  }
}
