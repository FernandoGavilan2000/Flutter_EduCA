import 'package:flutter_educa/models/quizzinfo.dart';
import 'package:flutter_educa/models/quizzquestions.dart';
import 'package:flutter_educa/models/reading.dart';
import 'package:flutter_educa/models/videos.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  String URL_BASE = "https://educa-app.up.railway.app/";

  Future<List<Videos>?> getVideos(String course) async {
    var client = http.Client();
    var uri = Uri.parse(URL_BASE + course + '/videos/');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return videosFromJson(json);
    }
  }

  Future<List<QuizzInfo>?> getQuizzes(String course) async {
    var client = http.Client();
    var uri = Uri.parse(URL_BASE + course + '/quizzes/');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return quizzInfoFromJson(json);
    }
  }

  Future<List<QuizzQuestions>?> getQuestions(String course, String id) async {
    var client = http.Client();
    var uri = Uri.parse(URL_BASE + course + '/quizzes/' + id + '/questions');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return quizzQuestionsFromJson(json);
    }
  }

  Future<List<Videos>?> SearchVideosByTopic(String course, String topic) async {
    var client = http.Client();
    var uri = Uri.parse(URL_BASE + course + '/videos/?q=' + topic);
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return videosFromJson(json);
    }
  }

  Future<List<Reading>?> getReadings(String course) async {
    print(course);
    var client = http.Client();
    var uri = Uri.parse(URL_BASE + course + '/readings/');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return readingFromJson(json);
    }
  }
}
