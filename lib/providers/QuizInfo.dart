import 'package:flutter/cupertino.dart';

import '../models/quiz.dart';

class QuizInfo extends ChangeNotifier {
  int id;
  List<Question> questions;
  List<int>? answerSheet;

  String questionUI = "";
  List<String> answersUI = [];

  QuizInfo({
    required this.id,
    required this.questions,
  });

  void ChangeQuestionUI(String question) {
    questionUI = question;
    notifyListeners();
  }
}
