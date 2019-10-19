import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:epicture/model/image.dart';

class ImageGrid extends StatefulWidget {
  final ImgurImage photo;
  ImageGrid(this.photo);

  @override
  State<StatefulWidget> createState() {
    return ImageGridState(photo);
  }
}

class ImageGridState extends State<ImageGrid> {
  ImgurImage photo;
  String renderUrl;
  ImageGridState(this.photo);
  Color favColor = Colors.white;
  bool isFav = false;
  Color upColor = Colors.white;
  bool isUp = false;

  Widget get imageCard {
    return new Card(
      color: Colors.black54,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(child: Text(photo.title, style: TextStyle(color: Colors.white, height: 1,
              fontSize: 20, fontWeight: FontWeight.bold))),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(photo.views.toString(), style: TextStyle(color: Colors.white)),
              Icon(Icons.remove_red_eye, color: Colors.white),
            ],),
          new CachedNetworkImage(imageUrl: photo.link),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Container(
      child:  imageCard,
    );
  }
}