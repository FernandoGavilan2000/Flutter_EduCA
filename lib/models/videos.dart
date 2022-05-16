// To parse this JSON data, do
//
//     final videos = videosFromJson(jsonString);

import 'dart:convert';

List<Videos> videosFromJson(String str) =>
    List<Videos>.from(json.decode(str).map((x) => Videos.fromJson(x)));

String videosToJson(List<Videos> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Videos {
  Videos({
    required this.url,
    required this.titulo,
    required this.desc,
    required this.imagen,
  });

  String url;
  String titulo;
  String desc;
  String imagen;

  factory Videos.fromJson(Map<String, dynamic> json) => Videos(
        url: json["url"],
        titulo: json["titulo"],
        desc: json["desc"],
        imagen: json["imagen"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "titulo": titulo,
        "desc": desc,
        "imagen": imagen,
      };
}
