import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

import 'package:epicture/model/image.dart';
import 'imageBar.dart';
import 'imageTags.dart';

class ImageCard extends StatefulWidget {
  final ImgurImage photo;
  oauth2.Client client;
  bool isCommentPage;

  ImageCard(this.client, this.photo, this.isCommentPage);
  @override
  State<StatefulWidget> createState() => ImageCardState(photo);
}

class ImageCardState extends State<ImageCard> {
  ImgurImage photo;
  String renderUrl;
  ImageCardState(this.photo);
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
            new ImageTags(photo),
            new ImageBar(widget.client, photo, widget.isCommentPage),
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