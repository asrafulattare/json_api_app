import '../model/photos_model.dart';
import 'package:http/http.dart' as http;

class PhotosHelper {
  Future<List<Photos>?> getPhotos() async {
    var responsed = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if (responsed.statusCode == 200) {
      var json = responsed.body;
      return photosFromJson(json);
    }
    return null;
  }
}
