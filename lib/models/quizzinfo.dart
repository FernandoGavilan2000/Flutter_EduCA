// To parse this JSON data, do
//
//     final quizzInfo = quizzInfoFromJson(jsonString);

import 'dart:convert';

List<QuizzInfo> quizzInfoFromJson(String str) =>
    List<QuizzInfo>.from(json.decode(str).map((x) => QuizzInfo.fromJson(x)));

String quizzInfoToJson(List<QuizzInfo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuizzInfo {
  QuizzInfo({
    required this.id,
    required this.titulo,
    required this.about,
  });

  String id;
  String titulo;
  String about;

  factory QuizzInfo.fromJson(Map<String, dynamic> json) => QuizzInfo(
        id: json["id"],
        titulo: json["titulo"],
        about: json["about"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "about": about,
      };
}
