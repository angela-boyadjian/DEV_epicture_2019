import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oauth2/oauth2.dart' as oauth2;

import 'package:epicture/model/image.dart';
import 'package:epicture/model/requests.dart';
import 'package:epicture/images/photosList.dart';
import 'homeBar.dart';

class HomePage extends StatefulWidget {
  List<ImgurImage> photos;
  oauth2.Client client;

  HomePage({Key key, this.client}) : super(key: new Key("HomePage"));
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  var  mPageCount = 0;

  void increment() => this.mPageCount++;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(45.0),
          child: new HomeBar(context: context, client: widget.client),
      ),
        backgroundColor: Colors.black54,
        body: new FutureBuilder<List<ImgurImage>>(
          future: this.gettingData(),
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
    this.increment();
    return getData(new http.Client(), this.mPageCount);
  }
}