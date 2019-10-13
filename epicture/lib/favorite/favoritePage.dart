import 'package:flutter/material.dart';

import 'package:epicture/images/photosList.dart';
import 'package:epicture/model/image.dart';
import 'package:epicture/model/requests.dart';

class FavoritePage extends StatefulWidget {
  List<ImgurImage> photos;

  @override
  FavoritePageState createState() => new FavoritePageState();
}
class FavoritePageState extends State<FavoritePage> {

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.favorite,
                size: 160.0,
                color: Colors.white,
              ),
              Text(
                "Tap the heart on any posts to save it",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Text(
                "in your favorites",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}