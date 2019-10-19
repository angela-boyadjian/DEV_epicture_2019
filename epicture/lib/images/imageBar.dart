import 'package:flutter/material.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

import 'package:epicture/model/image.dart';
import 'package:epicture/comments/commentPage.dart';

class ImageBar extends StatefulWidget {
  final ImgurImage photo;
  oauth2.Client client;
  bool isCommentPage;

  ImageBar(this.client, this.photo, this.isCommentPage);

  @override
  State<StatefulWidget> createState() => ImageBarState();
}

class ImageBarState extends State<ImageBar> {
  Color favColor = Colors.white;
  bool isFav = false;
  Color upColor = Colors.white;
  bool isUp = false;
  Color downColor = Colors.white;
  bool isDown = false;

  Widget get imageBar {
    return new ButtonTheme.bar(
      child: new ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          new FlatButton.icon(
              icon: Icon(Icons.thumb_up, color: upColor),
              label: Text(widget.photo.ups.toString(), style: TextStyle(color: Colors.white)),
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
          new Visibility(
            child: FlatButton.icon(
                icon: Icon(Icons.thumb_down, color: downColor),
                label: Text(widget.photo.downs.toString(), style: TextStyle(color: Colors.white)),
                onPressed: () { setState(() {
                  if (isDown) {
                    downColor = Colors.white;
                    isDown = false;
                  } else {
                    downColor = Colors.red;
                    isDown = true;
                  }
                });},
            ),
            visible: widget.isCommentPage,
          ),
          new Visibility(
            child: FlatButton.icon(
                icon: Icon(Icons.comment, color: Colors.white),
                label: Text(widget.photo.commentCount.toString(), style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => CommentPage(widget.client, widget.photo)));
                }
            ),
            visible: !widget.isCommentPage,
          ),
          new FlatButton.icon(
              icon: Icon(Icons.favorite, color: favColor),
              label: Text(widget.photo.favoriteCount.toString(), style: TextStyle(color: Colors.white)),
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