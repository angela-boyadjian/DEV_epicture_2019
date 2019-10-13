import 'package:flutter/material.dart';

import 'package:epicture/model/image.dart';
import 'package:http/http.dart' as http;
import 'package:epicture/model/requests.dart';
import 'package:epicture/images/photosList.dart';

class SearchImg extends StatefulWidget {
  List<ImgurImage> photos;
  var  mPageCount = 0;

  @override
  SearchImgState createState() => new SearchImgState();
}

class SearchImgState extends State<SearchImg> {
  Widget appBarTitle = new Text(
    "Search Imgur",
    style: new TextStyle(color: Colors.white),
  );
  Icon icon = new Icon(
    Icons.search,
    color: Colors.white,
  );

  List<dynamic> _list;
  final globalKey = new GlobalKey<ScaffoldState>();
  final TextEditingController _controller = new TextEditingController();
  bool _isSearching;
  String _searchText = "";
  List searchresult = new List();

  SearchImgState() {
    _controller.addListener(() {
      if (_controller.text.isEmpty) {
        setState(() {
          _isSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _isSearching = true;
          _searchText = _controller.text;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _isSearching = false;
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black54,
      key: globalKey,
      appBar: buildAppBar(context),
      body: new FutureBuilder<List<ImgurImage>>(
        future: gettingSearchData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new PhotosList(photos: snapshot.data)
              : new Center(child: new CircularProgressIndicator());
        },
      ),
    );
  }

  Future<List<ImgurImage>> gettingSearchData() {
    widget.mPageCount++;
    return getData(new http.Client(), widget.mPageCount);
  }

  Widget buildAppBar(BuildContext context) {
    return new AppBar(backgroundColor: Colors.black54, centerTitle: true,
    title: appBarTitle,
    actions: <Widget>[
      new IconButton(
        icon: icon,
        onPressed: () {
          setState(() {
            if (this.icon.icon == Icons.search) {
              this.icon = new Icon(
                Icons.close,
                color: Colors.white,
              );
              this.appBarTitle = new TextField(
                controller: _controller,
                style: new TextStyle(
                  color: Colors.white,
                ),
                decoration: new InputDecoration(
                    prefixIcon: new Icon(Icons.search, color: Colors.white),
                    hintText: "Search...",
                    hintStyle: new TextStyle(color: Colors.white)),
                onChanged: searchOperation,
              );
              _handleSearchStart();
            } else {
              _handleSearchEnd();
            }
          });
        },
      ),
    ]);
  }

  void _handleSearchStart() {
    setState(() {
      _isSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.icon = new Icon(
        Icons.search,
        color: Colors.white,
      );
      this.appBarTitle = new Text(
        "Search Imgur",
        style: new TextStyle(color: Colors.white),
      );
      _isSearching = false;
      _controller.clear();
    });
  }

  void searchOperation(String searchText) {
    searchresult.clear();
    if (_isSearching != null) {
      for (int i = 0; i < _list.length; i++) {
        String data = _list[i];
        if (data.toLowerCase().contains(searchText.toLowerCase())) {
          searchresult.add(data);
        }
      }
    }
  }
}