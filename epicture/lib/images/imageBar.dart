import 'package:flutter/material.dart';

import 'package:epicture/model/image.dart';

class ImageBar extends StatefulWidget {
  final ImgurImage photo;
  ImageBar(this.photo);

  @override
  State<StatefulWidget> createState() {
    return ImageBarState(photo);
  }
}

class ImageBarState extends State<ImageBar> {
  ImgurImage photo;
  ImageBarState(this.photo);
  Color favColor = Colors.white;
  bool isFav = false;
  Color upColor = Colors.white;
  bool isUp = false;

  Widget get imageBar {
    return new ButtonTheme.bar(
      child: new ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          new FlatButton.icon(
              icon: Icon(Icons.thumb_up, color: upColor),
              label: Text(photo.ups.toString(), style: TextStyle(color: Colors.white)),
              onPressed: () { setState(() {
                if (isUp) {
                  upColor = Colors.white;
                  isUp = false;
                } else {
                  upColor = Colors.green;
                  isUp = true;
                }
              });},
          ),
          new FlatButton.icon(
              icon: Icon(Icons.comment, color: Colors.white),
              label: Text(photo.commentCount.toString(), style: TextStyle(color: Colors.white)),
              onPressed: () {}
          ),
          new FlatButton.icon(
              icon: Icon(Icons.favorite, color: favColor),
              label: Text(photo.favoriteCount.toString(), style: TextStyle(color: Colors.white)),
              onPressed: () { setState(() {
                if (isFav) {
                  favColor = Colors.white;
                  isFav = false;
                } else {
                  favColor = Colors.pink;
                  isFav = true;
                }
              });},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child:  imageBar,
    );
  }
}