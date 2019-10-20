import 'package:flutter/material.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

import 'package:epicture/model/image.dart';
import 'package:epicture/images/imageCard.dart';
import 'package:epicture/model/album.dart';

class AlbumList extends StatefulWidget {
  final List<Album> albums;
  oauth2.Client client;

  AlbumList({Key key, this.client, this.albums}) : super(key: key);
  @override
  AlbumListState createState() => new AlbumListState();
}

class AlbumListState extends State<AlbumList> {
  ScrollController _controller;

  AlbumListState();

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
      controller: _controller,
      itemCount: widget.albums[0].getImages.length,
      itemBuilder: (context, index) {
        return ImageCard(widget.client, widget.albums[0].getImages[index], false);
      },
    );
  }
}