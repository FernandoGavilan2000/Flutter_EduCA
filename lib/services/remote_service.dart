import 'package:flutter_educa/models/quiz.dart';
import 'package:flutter_educa/models/reading.dart';
import 'package:flutter_educa/models/videos.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Videos>?> getVideos(String course) async {
    var client = http.Client();
    var uri =
        Uri.parse('https://apihackunica.herokuapp.com/' + course + '/videos/');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return videosFromJson(json);
    }
  }

  Future<List<Videos>?> SearchVideosByTopic(String course, String topic) async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://apihackunica.herokuapp.com/' + course + '/videos/?q=' + topic);
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return videosFromJson(json);
    }
  }

  Future<List<Reading>?> getReadings(String course) async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://apihackunica.herokuapp.com/' + course + '/readings/');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return readingFromJson(json);
    }
  }
}
