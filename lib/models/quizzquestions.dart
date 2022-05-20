// To parse this JSON data, do
//
//     final quizzQuestions = quizzQuestionsFromJson(jsonString);

import 'dart:convert';

List<QuizzQuestions> quizzQuestionsFromJson(String str) =>
    List<QuizzQuestions>.from(
        json.decode(str).map((x) => QuizzQuestions.fromJson(x)));

String quizzQuestionsToJson(List<QuizzQuestions> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuizzQuestions {
  QuizzQuestions({
    required this.titulo,
    required this.options,
    required this.index,
  });

  String titulo;
  List<String> options;
  int index;

  factory QuizzQuestions.fromJson(Map<String, dynamic> json) => QuizzQuestions(
        titulo: json["titulo"],
        options: List<String>.from(json["options"].map((x) => x)),
        index: json["index"],
      );

  Map<String, dynamic> toJson() => {
        "titulo": titulo,
        "options": List<dynamic>.from(options.map((x) => x)),
        "index": index,
      };
}
