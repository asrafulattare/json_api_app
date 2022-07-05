import 'package:json_api_app/model/comments_model.dart';

import 'package:http/http.dart' as http;

class CommentsHelper {
  Future<List<Comments>?> getComments() async {
    var responsed = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    if (responsed.statusCode == 200) {
      var json = responsed.body;
      return commentsFromJson(json);
    }
    return null;
  }
}
