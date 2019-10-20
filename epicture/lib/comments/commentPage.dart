import 'package:flutter/material.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

import 'package:epicture/model/image.dart';
import 'package:epicture/model/comment.dart';
import 'commentList.dart';
import 'package:epicture/model/requests.dart';
import 'package:epicture/images/imageCard.dart';

class CommentPage extends StatefulWidget {
  ImgurImage photo;
  oauth2.Client client;

  CommentPage(this.client, this.photo);
  @override
  CommentPageState createState() => new CommentPageState();
}

class CommentPageState extends State<CommentPage> {
  List<Comment> comments = [];
  ScrollController _controller;

  _scrollListener() {}

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: PreferredSize(preferredSize: Size.fromHeight(45.0),
          child: AppBar(
            backgroundColor: Colors.black38,
            title: Text("Comments"),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context)
            ),
          ),
      ),
      body:  ListView(
        controller: _controller,
        children: <Widget>[
          ImageCard(widget.client, widget.photo, true),
          FutureBuilder<List<Comment>>(
            future: getComments(widget.client, widget.photo.id),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                ? new CommentList(comments: snapshot.data)
                : new Center(child: new CircularProgressIndicator());
            },
          ),
        ],)
    );
  }
}