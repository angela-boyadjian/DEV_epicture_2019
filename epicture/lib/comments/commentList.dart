import 'package:epicture/comments/commentCard.dart';
import 'package:flutter/material.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

import 'package:epicture/model/comment.dart';
import 'commentCard.dart';

class CommentList extends StatefulWidget {
  List<Comment> comments;

  CommentList({Key key, this.comments}) : super(key: key);
  @override
  CommentListState createState() => new CommentListState();
}

class CommentListState extends State<CommentList> {

  ScrollController _controller;

  CommentListState();

  _scrollListener() {}

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      controller: _controller,
      itemCount: widget.comments.length,
      itemBuilder: (context, index) {
        return new CommentCard(widget.comments[index]);
      },
    );
  }
}