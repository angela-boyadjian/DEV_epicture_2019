import 'package:flutter/material.dart';
import 'dart:io';
import 'package:oauth2/oauth2.dart' as oauth2;

import 'package:flutter/widgets.dart';
import 'package:epicture/model/requests.dart';
import 'package:epicture/model/upload.dart';
import 'package:epicture/mainTabBar.dart';

class UploadInfo extends StatefulWidget {
  File imageFile;
  oauth2.Client client;

  UploadInfo({Key key, this.client, this.imageFile}) : super(key: key);
  @override
  UploadInfoState createState() => new UploadInfoState();
}

class UploadInfoState extends State<UploadInfo> {
  final  titleController = TextEditingController();
  final  desController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    desController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Column(
        children: <Widget>[
        new Padding(padding: EdgeInsets.only(top: 100.0)),
          new Container(
            margin: const EdgeInsets.only(right: 20, left: 20),
            child: new TextField(
              controller: titleController,
              keyboardType: TextInputType.text,
              style: new TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
              ),
              decoration: new InputDecoration(
                labelText: "Title",
                labelStyle: new TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                fillColor: Colors.white,
                enabledBorder: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: new BorderSide(color: Colors.white, width: 1.0)),
              ),
            ),
          ),
          SizedBox(height: 100),
          new Container(
            margin: const EdgeInsets.only(right: 20, left: 20),
            child: new TextField(
              controller: desController,
              keyboardType: TextInputType.text,
              style: new TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
              ),
              decoration: new InputDecoration(
                labelText: "Description",
                labelStyle: new TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                fillColor: Colors.white,
                enabledBorder: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: new BorderSide(color: Colors.white, width: 1.0)),
              ),
            ),
          ),
          new Padding(padding: EdgeInsets.only(top: 80.0)),
          FlatButton(
            child: Icon(Icons.cloud_upload, color: Colors.blue, size: 60),
            color: Colors.white,
            shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                    side: BorderSide(color: Colors.white)
            ),
            onPressed: ()  {
              var imgObj = new ImageToPost(widget.imageFile,
                titleController.text, desController.text);
              postImage(widget.client, imgObj);
              Navigator.push(context, new MaterialPageRoute(
                builder: (context) => MainTabBar(widget.client)));
            }
          ),
        ],
      ),
    );
  }
}