import 'package:flutter/material.dart';

import 'package:epicture/profile/posts.dart';
import 'package:epicture/profile/comments.dart';
import 'package:epicture/profile/about.dart';
import 'package:epicture/profile/following.dart';

import 'package:epicture/home/imageCapture.dart';


class ProfilePage extends StatefulWidget {

  @override
  ProfilePageState createState() => new ProfilePageState();
 }

class ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black54,
            bottom: TabBar(
              tabs: [
                Tab(text: 'Posts'),
                Tab(text: 'Following'),
                Tab(text: 'Comments'),
                Tab(text: 'About')
              ],
            ),
            title: Text('User'),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.share
                )
              ),
              IconButton(
                  icon: Icon(
                      Icons.settings
                  )
              ),
              IconButton(
                onPressed: () {
                Navigator.push(context, new MaterialPageRoute(
                  builder: (context) => ImageCapture(),
                  ),);
                },
                icon: Icon(Icons.add_a_photo, color: Colors.white),
              ),
            ]
          ),
          body: TabBarView(
            children: [
              Posts(),
              Comments(),
              Following(),
              About(),
            ],
          ),
        ),
      ),
    );
  }
}
