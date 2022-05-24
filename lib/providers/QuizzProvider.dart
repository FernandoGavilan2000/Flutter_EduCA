import 'package:flutter/cupertino.dart';
import 'package:flutter_educa/models/quizzquestions.dart';

class QuizzProvider extends ChangeNotifier {
  List<QuizzQuestions>? questions = [];
  int indexQuestion = 0;
  late List<int> answersheet;
  QuizzProvider({
    required this.questions,
  });

  void nextQuestion() {
    indexQuestion++;
    notifyListeners();
  }

  void saveAnswer(int indexAnswer) {
    answersheet[indexQuestion] = indexAnswer;
    notifyListeners();
  }

  void prevQuestion() {
    indexQuestion--;
    notifyListeners();
  }
}
