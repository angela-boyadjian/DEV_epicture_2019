import 'package:epicture/home/imageCapture.dart';
import 'package:flutter/material.dart';

import 'upload.dart';
import 'imageCapture.dart';

class HomeBar extends StatefulWidget {
  BuildContext context;
  HomeBar(this.context);

  @override
  State<StatefulWidget> createState() => new HomeBarState(context);
}

class HomeBarState extends State<HomeBar> {
  BuildContext context;
  HomeBarState(this.context);

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
            Navigator.push(context, new MaterialPageRoute(
              // builder: (context) => Upload(),
              builder: (context) => ImageCapture(),
            ),);
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