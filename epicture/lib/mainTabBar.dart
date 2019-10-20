import 'package:flutter/material.dart';

import 'package:oauth2/oauth2.dart' as oauth2;

import 'package:epicture/favorite/favoritePage.dart';
import 'package:epicture/home/homePage.dart';
import 'package:epicture/profile/profilePage.dart';
import 'package:epicture/search/searchPage.dart';

class MainTabBar extends StatefulWidget {
  oauth2.Client client;

  MainTabBar({Key key, this.client}) : super(key: new Key("pageview"));
  @override
  MainTabBarState createState() => new MainTabBarState();
}

class MainTabBarState extends State<MainTabBar> with SingleTickerProviderStateMixin {
  TabController controller;
  int test = 0;

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

  get testVar { return this.test; }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: <Widget>[HomePage(client: widget.client), SearchPage(widget.client),
          FavoritePage(widget.client), ProfilePage(widget.client)],
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