import 'package:flutter/material.dart';

import 'package:picture_gallery/pictures-array.dart';
import 'package:picture_gallery/pictures.dart';

import 'data.dart';

class PicturePage extends StatefulWidget {
  @override
  _PicturePageState createState() => _PicturePageState();
}

class _PicturePageState extends State<PicturePage> {
  Future<List<Hits>> hits;
  // final String uri =
  //     'https://pixabay.com/api/?key=16818018-fbba47cef3e86a3fc55f434d8&q=Nature&per_page=200&image_type=photo&pretty=true';

  // Future<List<Hits>> getApi() async {
  //   var res = await http.get(uri);
  //   if (res.statusCode == 200) {
  //     final jsonList = jsonDecode(res.body)['hits'];

  //     if (jsonList is List) {
  //       return jsonList.map((json) => Hits.fromJson(json)).toList();
  //     }
  //   }

  //   throw Exception('Here is nothing');
  // }

  getTenFromApi() {
    for (var i = 0; i < 10; i++) {
      getApi();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTenFromApi();
    hits = getApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: hits,
          builder: (BuildContext context, AsyncSnapshot<List<Hits>> snapshot) {
            if (snapshot.hasData) {
              return GridView.extent(
                maxCrossAxisExtent: 150.0,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5.0,
                padding: const EdgeInsets.all(5.0),
                children: snapshot.data
                    .map((array) => PicturesArray(hits: array))
                    .toList(),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                ),
              );
            }
          }),
    );
  }
}
