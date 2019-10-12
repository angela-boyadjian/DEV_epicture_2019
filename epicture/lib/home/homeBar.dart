import 'package:flutter/material.dart';

class HomeBar extends StatefulWidget {
  HomeBar();

  @override
  State<StatefulWidget> createState() {
    return HomeBarState();
  }
}

class HomeBarState extends State<HomeBar> {

  HomeBarState();

  Widget get homeBar {
    return new AppBar(
      backgroundColor: Colors.black54,
      title: Text("Most Viral"),
      centerTitle: true, 
      leading: IconButton(
        onPressed: (){
          // TODO button Logic
        },
        icon: Icon(Icons.swap_vert, color: Colors.white)),
      actions: <Widget>[
        IconButton(
          onPressed: (){
            // TODO Button logic
          },
          icon: Icon(Icons.add_a_photo, color: Colors.white),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child:  homeBar,
    );
  }
}