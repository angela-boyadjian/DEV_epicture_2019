import 'package:flutter/material.dart';

import 'package:epicture/model/comment.dart';

class CommentBar extends StatefulWidget {
  final Comment comment;
  CommentBar(this.comment);

  @override
  State<StatefulWidget> createState() => CommentBarState();
}

class CommentBarState extends State<CommentBar> {
  Color favColor = Colors.white;
  bool isFav = false;
  Color upColor = Colors.white;
  bool isUp = false;
  Color downColor = Colors.white;
  bool isDown = false;

  Widget get commentBar {
    return new ButtonTheme.bar(
      child: ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.thumb_up, color: upColor),
            label: Text(widget.comment.ups.toString(), style: TextStyle(color: Colors.white)),
            onPressed: () { setState(() {
              if (isUp) {
                upColor = Colors.white;
                isUp = false;
              } else {
                upColor = Colors.green;
                isUp = true;
                isDown = false;
                downColor = Colors.white;
              }
            });},
          ),
          FlatButton.icon(
            icon: Icon(Icons.thumb_down, color: downColor),
            label: Text(widget.comment.downs.toString(), style: TextStyle(color: Colors.white)),
            onPressed: () { setState(() {
              if (isDown) {
                downColor = Colors.white;
                isDown = false;
              } else {
                downColor = Colors.red;
                isDown = true;
                isUp = false;
                upColor = Colors.white;
              }
            });}
          ),
          Text("Reply", style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: commentBar,
    );
  }
}