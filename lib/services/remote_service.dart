import 'package:flutter_educa/models/videos.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Videos>?> getVideos(String topic) async {
    var client = http.Client();

    var uri = Uri.parse(
        'https://apihackunica.herokuapp.com/comunicacion/videos/?q=' + topic);
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return videosFromJson(json);
    }
  }
}
