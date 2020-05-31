import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:picture_gallery/details-page.dart';
import 'package:picture_gallery/pictures.dart';

class PicturesArray extends StatelessWidget {
  final Hits hits;

  const PicturesArray({Key key, this.hits}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (hits == null) {
      return Container(
        child: Container(
          child: Image.network(
            'https://consaltliga.com.ua/wp-content/themes/consultix/images/no-image-found-360x250.png',
            fit: BoxFit.fill,
          ),
        ),
      );
    } else {
      return Container(
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailsPage(
                  hits: hits,
                ),
              ),
            );
          },
          child: Container(
            child: CachedNetworkImage(
              placeholder: (context, url) => const CircularProgressIndicator(),
              imageUrl: '${hits.largeImageURL}',
              fit: BoxFit.fill,
            ),
          ),
        ),

        // child: Container(
        //   child: Image.network(
        //     hits.largeImageURL.toString(),
        //     fit: BoxFit.fill,
        //   ),
        // ),
      );
    }
  }
}
