import 'package:flutter/material.dart';

import 'package:epicture/model/image.dart';
import 'imageGrid.dart';

class PhotosGrid extends StatefulWidget {
  final List<ImgurImage> photos;

  PhotosGrid({Key key, this.photos}) : super(key: key);
  @override
  PhotosGridState createState() => new PhotosGridState();
}

class PhotosGridState extends State<PhotosGrid> {

  ScrollController _controller;

  PhotosGridState();

  _scrollListener() {

  }

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        children: List.generate(widget.photos.length, (index) {
          return ImageGrid(widget.photos[index]);
        })
    );
  }
}
