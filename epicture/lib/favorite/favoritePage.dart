import 'package:flutter/material.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

import 'package:epicture/images/photosList.dart';
import 'package:epicture/model/image.dart';
import 'package:epicture/model/requests.dart';

class FavoritePage extends StatefulWidget {
  List<ImgurImage> photos;
  oauth2.Client client;

  FavoritePage(this.client);

  @override
  FavoritePageState createState() => new FavoritePageState();
}
class FavoritePageState extends State<FavoritePage> {

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: new FutureBuilder<List<ImgurImage>>(
        future: gettingFavorite(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new PhotosList(photos: snapshot.data)
              : new Center(child: new CircularProgressIndicator());
        },
      ),
    );
    }
    Future<List<ImgurImage>> gettingFavorite() {
      return getFavorite(widget.client);
  }
}