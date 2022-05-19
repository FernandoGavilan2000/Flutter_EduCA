import 'package:flutter/cupertino.dart';

class CourseProvider extends ChangeNotifier {
  String courseName;
  List<String>? goals;

  CourseProvider({
    this.courseName = '',
  });

  void changeCourse(String newCourse, List<String> newgoals) {
    courseName = newCourse;
    goals = newgoals;
    notifyListeners();
  }
}
