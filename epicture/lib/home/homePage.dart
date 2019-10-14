import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:epicture/model/image.dart';
import 'package:epicture/model/requests.dart';
import 'package:epicture/images/photosList.dart';
import 'homeBar.dart';

class HomePage extends StatefulWidget {
  List<ImgurImage> photos;
  var  mPageCount = 0;
  @override
  HomePageState createState() => new HomePageState();
}

// add_a_photo 
class HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(45.0),
          child: new HomeBar(context),
      ),
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