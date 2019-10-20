import 'package:epicture/model/requests.dart';
import 'package:flutter/material.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

import 'package:epicture/model/image.dart';
import 'package:epicture/comments/commentPage.dart';

class ImageBar extends StatefulWidget {
  final ImgurImage photo;
  oauth2.Client client;
  bool isCommentPage;

  ImageBar({Key key, this.client, this.photo, this.isCommentPage}) : super(key: new Key("ImageBar"));

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
  int upVote;
  bool hasUpVoted = false;
  int downVote;
  bool hasDownVoted = false;
  int fav;
  bool hasFav = false;

  String getUpVote() {
    this.upVote = widget.photo.ups;
    if (this.hasUpVoted)
      this.upVote += 1;
    return upVote.toString();
  }

  String getDownVote() {
    this.downVote = widget.photo.downs;
    if (this.hasDownVoted)
      this.downVote += 1;
    return downVote.toString();
  }

  String getFav() {
    this.fav = widget.photo.favoriteCount;
    if (this.hasFav)
      this.fav += 1;
    return fav.toString();
  }

  Widget get imageBar {
    return new ButtonTheme.bar(
      child: new ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          new FlatButton.icon(
              icon: Icon(Icons.thumb_up, color: upColor),
              label: Text(widget.photo.ups == null ? "42" :
                getUpVote(), style: TextStyle(color: Colors.white)),
              onPressed: () { setState(() {
                if (isUp) {
                  hasUpVoted = false;
                  upColor = Colors.white;
                  isUp = false;
                } else {
                  hasUpVoted = true;
                  upColor = Colors.green;
                  isUp = true;
                  isDown = false;
                  downColor = Colors.white;
                }
              });},
          ),
          new Visibility(
            child: FlatButton.icon(
                icon: Icon(Icons.thumb_down, color: downColor),
                label: Text(getDownVote(), style: TextStyle(color: Colors.white)),
                onPressed: () { setState(() {
                  if (isDown) {
                    hasDownVoted = false;
                    downColor = Colors.white;
                    isDown = false;
                  } else {
                    hasDownVoted = true;
                    downColor = Colors.red;
                    isDown = true;
                    isUp = false;
                    upColor = Colors.white;
                  }
                });},
            ),
            visible: widget.isCommentPage,
          ),
          new Visibility(
            child: FlatButton.icon(
                icon: Icon(Icons.comment, color: Colors.white),
                label: Text(widget.photo.commentCount == null ? "12" :
                  widget.photo.commentCount.toString(), style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => CommentPage(widget.client, widget.photo)));
                }
            ),
            visible: !widget.isCommentPage,
          ),
          new FlatButton.icon(
              icon: Icon(Icons.favorite, color: favColor),
              label: Text(widget.photo.favoriteCount == null ? "36" :
                getFav(), style: TextStyle(color: Colors.white)),
              onPressed: () { setState(() {
                if (isFav) {
                  hasFav = false;
                  favColor = Colors.white;
                  isFav = false;
                } else {
                  addToFavorite(widget.client, widget.photo.id);
                  hasFav = true;
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