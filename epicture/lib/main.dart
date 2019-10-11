import 'package:flutter/material.dart';

import 'package:epicture/tabs/favorite.dart';
import 'package:epicture/tabs/home.dart';
import 'package:epicture/tabs/profile.dart';
import 'package:epicture/tabs/search.dart';

import 'package:epicture/model/image.dart';

void main() {
  runApp(MaterialApp(
      title: "Epicture",
      home: MyHome()));
}

class MyHome extends StatefulWidget {
   MyHome({Key key, this.title}) : super(key: key);
  final String title;

  @override
  MyHomeState createState() => MyHomeState();
}

class MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  TabController controller;
  bool isLoading = false;
  int itemType = ImgurImage.TYPE_PROGRESS;
  List<ImgurImage> imageList = [];
  ScrollController _controller;

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      _fetchImages();
    }
  }

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
    _fetchImages();
  }
  // @override
  // void initState() {
  //   super.initState();
  //   controller = TabController(length: 4, vsync: this);
  // }
  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Epicture"),
        backgroundColor: Colors.blueGrey,
      ),
      body: _loadView(),
      // body: TabBarView(
      //   children: <Widget>[FavoriteTab(), SearchTab(), HomeTab(), ProfileTab()],
      //   controller: controller,

      // ),
      // bottomNavigationBar: Material(
      //   color: Colors.blueGrey,
      //   child: TabBar(
      //     tabs: <Tab>[
      //       Tab(
      //         icon: Icon(Icons.favorite),
      //       ),
      //       Tab(
      //         icon: Icon(Icons.search),
      //       ),
      //       Tab(
      //         icon: Icon(Icons.home),
      //       ),
      //       Tab(
      //         icon: Icon(Icons.account_circle),
      //       ),
      //     ],
      //     controller: controller,
      //   ),
      // ),
    );
  }

Widget _loadView() {
    if (imageList.length == 0 ||
        (imageList.length == 1 &&
            imageList[0].itemType == ImgurImage.TYPE_PROGRESS)) {
      return Center(child: CircularProgressIndicator());
    } else if (imageList.length == 1 &&
        imageList[0].itemType == ImgurImage.TYPE_ERROR) {
      return Center(
        child: RaisedButton(
          onPressed: () {
            _fetchImages();
          },
          child: Text('Try Again'),
        ),
      );
    } else {
      itemType = imageList[imageList.length - 1].itemType;
      return Column(
        children: <Widget>[
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              controller: _controller,
              children: List.generate(
                imageList.length,
                (index) {
                  var image = imageList[index];
                  if (image.itemType == ImgurImage.TYPE_ITEM) {
                            placeholder: 'assets/imgur_placeholder.jpg',
                    return Center(
                        child: FadeInImage.assetNetwork(
                            image: image.link));
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ),
          _showIndicator(),
        ],
      );
    }
  }

  Widget _showIndicator() {
    if (itemType == ImgurImage.TYPE_PROGRESS) {
      return Container(
        margin: EdgeInsets.all(20),
        child: Center(child: CircularProgressIndicator()),
      );
    } else {
      return Container();
    }
  }

  void _fetchImages() async {
    if (!isLoading) {
      isLoading = true;

      if (imageList.length == 1) imageList.removeLast();
      imageList.add(ImgurImage(link: "", itemType: ImgurImage.TYPE_PROGRESS));
      setState(() {});

      await fetchImages().then((imgurImages) {
        imageList.removeLast();
        for (var value in imgurImages.images) {
          if (value != null) {
            imageList.add(value);
          }
        }
      }).catchError((error) {
        imageList.removeLast();
        if (imageList.length == 0)
          imageList.add(ImgurImage(link: "", itemType: ImgurImage.TYPE_ERROR));
        }).whenComplete(() {
        isLoading = false;
        setState(() {});
      });
    }
  }
}