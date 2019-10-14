import 'package:epicture/home/imageCapture.dart';
import 'package:flutter/material.dart';

import 'imageCapture.dart';
import 'package:epicture/const.dart';

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
      leading: PopupMenuButton<String>(
        elevation: 4,
        offset: Offset(0, 100),
        icon: Icon(Icons.swap_vert, color: Colors.white),
        onSelected: choiceAction,
        itemBuilder: (BuildContext context){
          return Constants.choices.map((String choice) {
            return PopupMenuItem<String>(
              value: choice,
              child: Text(choice),
            );
          }).toList();
        },
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {
            Navigator.push(context, new MaterialPageRoute(
              builder: (context) => ImageCapture(),
            ),);
          },
          icon: Icon(Icons.add_a_photo, color: Colors.white),
        ),
      ],
    );
  }


  void choiceAction(String choice) {
    if (choice == Constants.Newest) {
      print('Newest');
    } else if(choice == Constants.Popular) {
      print('Popular');
    } else if(choice == Constants.Random) {
      print('Random');
    }
  }
  @override
  Widget build(BuildContext context) {
    return new Container(
      child:  homeBar,
    );
  }
}