import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:epicture/model/image.dart';
import 'imageCard.dart';

class HomeTab extends StatefulWidget {
  List<ImgurImage> photos;
  var  mPageCount = 0;
  @override
  HomeTabState createState() => new HomeTabState();
}

class HomeTabState extends State<HomeTab> {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black54,
        body: new FutureBuilder<List<ImgurImage>>(
          future: gettingData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? new PhotosList(photos: snapshot.data)
                : new Center(child: new CircularProgressIndicator());
          },
        ),
    );
  }

  Future<List<ImgurImage>> gettingData() {
    widget.mPageCount++;
    return getData(new http.Client(), widget.mPageCount);
  }
}

class PhotosList extends StatefulWidget {
  final List<ImgurImage> photos;

  PhotosList({Key key, this.photos}) : super(key: key);
  @override
  PhotosListState createState() => new PhotosListState();
}

class PhotosListState extends State<PhotosList> {
  ScrollController _controller;

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
    return new ListView.builder(
      controller: _controller,
      itemCount: widget.photos.length,
      itemBuilder: (context, index) {
        return ImageCard(widget.photos[index]);
      },
    );
  }
}