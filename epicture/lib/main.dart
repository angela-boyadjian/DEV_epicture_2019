import 'package:flutter/material.dart';

import 'package:epicture/favorite/favoritePage.dart';
import 'package:epicture/home/homePage.dart';
import 'package:epicture/profile/profilePage.dart';
import 'package:epicture/search/searchPage.dart';

void main() {
  runApp(MaterialApp(
      title: "Epicture",
      home: new MyHome()));
}
class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => new MyHomeState();
}

class MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Epicture"),
      //   backgroundColor: Colors.black45,
      // ),
      body: TabBarView(
        children: <Widget>[HomePage(), SearchPage(), FavoritePage(), ProfilePage()],
        controller: controller,
      ),
      bottomNavigationBar: Material(
        color: Colors.black45,
        child: TabBar(
          tabs: <Tab>[
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.search),
            ),
            Tab(
              icon: Icon(Icons.favorite),
            ),
            Tab(
              icon: Icon(Icons.account_circle),
            ),
          ],
          controller: controller,
        ),
      ),
    );
  }
}