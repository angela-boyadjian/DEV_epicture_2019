import 'package:flutter/material.dart';

import 'package:epicture/model/comment.dart';
import 'commentBar.dart';

class CommentCard extends StatefulWidget {
  final Comment comment;

  CommentCard(this.comment);
  @override
  State<StatefulWidget> createState() => CommentCardState();
}

class CommentCardState extends State<CommentCard> {
  Widget get commentCard {
    return new Card(
      color: Colors.black54,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
              Text(widget.comment.author, style: TextStyle(color: Colors.grey)),
            ],),
            Text(widget.comment.comment, style: TextStyle(color: Colors.white, height: 1,
                  fontSize: 15, fontWeight: FontWeight.bold)),
            new CommentBar(widget.comment),
          ],
        ),
      );
  }
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: commentCard,
    );
  }
}