import 'package:flutter/material.dart';

import 'package:epicture/tabs/favorite.dart';
import 'package:epicture/tabs/home.dart';
import 'package:epicture/tabs/profile.dart';
import 'package:epicture/tabs/search.dart';

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
      appBar: AppBar(
        title: Text("Epicture"),
        backgroundColor: Colors.black45,
      ),
      body: TabBarView(
        children: <Widget>[HomeTab(), SearchTab(), FavoriteTab(), ProfileTab()],
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