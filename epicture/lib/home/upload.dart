import 'package:flutter/material.dart';
import 'dart:io';
import 'package:oauth2/oauth2.dart' as oauth2;

import 'package:image_cropper/image_cropper.dart';
import 'package:flutter/widgets.dart';
import 'uploadInfo.dart';

class Upload extends StatefulWidget {
  File imageFile;
  oauth2.Client client;

  Upload({Key key, this.client, this.imageFile}) : super(key: key);
  @override
  UploadState createState() => new UploadState(this.imageFile);
}

class UploadState extends State<Upload> {
  File imageFile;

  UploadState(this.imageFile);

  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.withOpacity(0.6),
      body: ListView(
        children: <Widget>[
          if (imageFile != null) ...[
            Container(
                padding: EdgeInsets.all(32), child: Image.file(imageFile)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  color: Colors.blueGrey,
                  child: Icon(Icons.crop, color: Colors.white),
                  onPressed: cropImage,
                ),
                FlatButton(
                  color: Colors.blueGrey,
                  child: Icon(Icons.refresh, color: Colors.white),
                  onPressed: () {
                    clear();
                    Navigator.pop(context);
                  }
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: FlatButton(
                  color: Colors.blueGrey,
                  child: Icon(Icons.edit, color: Colors.white),
                  onPressed: () {
                    Navigator.push(context, new MaterialPageRoute(
                        builder: (context) => UploadInfo(client: widget.client, imageFile: imageFile)));
                  },
                ),
            )
          ]
        ],
      ),
    );
  }
  
  Future<void> cropImage() async {
    File cropped = await ImageCropper.cropImage(
      sourcePath: imageFile.path,
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: 'Crop Image',
        toolbarColor: Colors.deepPurple,
        toolbarWidgetColor: Colors.white,),
      iosUiSettings: IOSUiSettings(
        minimumAspectRatio: 1.0,
      )
    );

    setState(() {
      imageFile = cropped ?? imageFile;
    });
  }

  void clear() {
    setState(() => imageFile = null);
  }
}