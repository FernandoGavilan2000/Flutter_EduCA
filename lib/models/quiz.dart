// To parse this JSON data, do
//
//     final quiz = quizFromJson(jsonString);

import 'dart:convert';

Quiz quizFromJson(String str) => Quiz.fromJson(json.decode(str));

String quizToJson(Quiz data) => json.encode(data.toJson());

class Quiz {
  Quiz({
    required this.id,
    required this.questions,
  });

  String id;
  List<Question> questions;

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
        id: json["id"],
        questions: List<Question>.from(
            json["questions"].map((x) => Question.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
      };
}

class Question {
  Question({
    required this.question,
    required this.answers,
    required this.correctIndex,
  });

  String question;
  List<String> answers;
  int correctIndex;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        question: json["question"],
        answers: List<String>.from(json["answers"].map((x) => x)),
        correctIndex: json["correctIndex"],
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "answers": List<dynamic>.from(answers.map((x) => x)),
        "correctIndex": correctIndex,
      };
}
