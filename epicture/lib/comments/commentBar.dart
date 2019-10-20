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
  int upVote;
  bool hasUpVoted = false;
  int downVote;
  bool hasDownVoted = false;

   String getUpVote() {
    this.upVote = widget.comment.ups;
    if (this.hasUpVoted)
      this.upVote += 1;
    return upVote.toString();
  }

  String getDownVote() {
    this.downVote = widget.comment.downs;
    if (this.hasDownVoted)
      this.downVote += 1;
    return downVote.toString();
  }

  Widget get commentBar {
    return new ButtonTheme.bar(
      child: ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.thumb_up, color: upColor),
            label: Text(getUpVote(), style: TextStyle(color: Colors.white)),
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
          FlatButton.icon(
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