import 'package:flutter/material.dart';

import 'package:oauth2/oauth2.dart' as oauth2;

import 'package:epicture/favorite/favoritePage.dart';
import 'package:epicture/home/homePage.dart';
import 'package:epicture/profile/profilePage.dart';
import 'package:epicture/search/searchPage.dart';

class MainTabBar extends StatefulWidget {
  oauth2.Client client;

  MainTabBar(this.client);
  @override
  MainTabBarState createState() => new MainTabBarState();
}

class MainTabBarState extends State<MainTabBar> with SingleTickerProviderStateMixin {
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
      body: TabBarView(
        children: <Widget>[HomePage(), SearchPage(), FavoritePage(widget.client), ProfilePage()],
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