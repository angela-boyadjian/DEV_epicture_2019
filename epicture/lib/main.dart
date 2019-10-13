import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;


import 'package:epicture/tabs/favorite.dart';
import 'package:epicture/tabs/home.dart';
import 'package:epicture/tabs/profile.dart';
import 'package:epicture/tabs/search.dart';
import 'package:epicture/login.dart';


void main() {
  runApp(MaterialApp(
      title: "Epicture",
      home: LoginPage()));
}

class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => MyHomeState();
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
        backgroundColor: Colors.blueGrey,
      ),
      body: TabBarView(
        children: <Widget>[FavoriteTab(), SearchTab(), HomeTab(), ProfileTab()],
        controller: controller,
      ),
      bottomNavigationBar: Material(
        color: Colors.blueGrey,
        child: TabBar(
          tabs: <Tab>[
            Tab(
              icon: Icon(Icons.favorite),
            ),
            Tab(
              icon: Icon(Icons.search),
            ),
            Tab(
              icon: Icon(Icons.home),
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
