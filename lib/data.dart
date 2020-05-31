import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:picture_gallery/pictures.dart';

final String uri =
    'https://pixabay.com/api/?key=16818018-fbba47cef3e86a3fc55f434d8&q=Nature&per_page=200&image_type=photo&pretty=true';

Future<List<Hits>> getApi() async {
  var res = await http.get(uri);
  if (res.statusCode == 200) {
    final jsonList = jsonDecode(res.body)['hits'];

    if (jsonList is List) {
      return jsonList.map((json) => Hits.fromJson(json)).toList();
    }
  }

  throw Exception('Here is nothing');
}
