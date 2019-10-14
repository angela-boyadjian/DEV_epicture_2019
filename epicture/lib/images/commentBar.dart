import 'package:flutter/material.dart';

import 'package:epicture/model/image.dart';

class CommentBar extends StatefulWidget {
  final ImgurImage photo;
  CommentBar(this.photo);

  @override
  State<StatefulWidget> createState() {
    return CommentBarState(photo);
  }
}

class CommentBarState extends State<CommentBar> {
  ImgurImage photo;
  CommentBarState(this.photo);
  Color favColor = Colors.white;
  bool isFav = false;
  Color upColor = Colors.white;
  bool isUp = false;

  Widget get CommentBar {
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
              label: Text("42", style: TextStyle(color: Colors.white)),
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
          new IconButton(
              icon: Icon(Icons.share, color: Colors.white),
              onPressed: () { },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child:  CommentBar,
    );
  }
}