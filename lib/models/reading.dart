// To parse this JSON data, do
//
//     final reading = readingFromJson(jsonString);

import 'dart:convert';

List<Reading> readingFromJson(String str) =>
    List<Reading>.from(json.decode(str).map((x) => Reading.fromJson(x)));

String readingToJson(List<Reading> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Reading {
  Reading({
    required this.id,
    required this.titulo,
    required this.contenido,
    required this.imagen,
  });

  String id;
  String titulo;
  String contenido;
  String imagen;

  factory Reading.fromJson(Map<String, dynamic> json) => Reading(
        id: json["id"],
        titulo: json["titulo"],
        contenido: json["contenido"],
        imagen: json["imagen"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "contenido": contenido,
        "imagen": imagen,
      };
}
