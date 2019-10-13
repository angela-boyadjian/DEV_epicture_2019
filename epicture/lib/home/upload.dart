import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:flutter/widgets.dart';

class Upload extends StatefulWidget {
  File imageFile;

  Upload({Key key, this.imageFile}) : super(key: key);
  @override
  UploadState createState() => new UploadState(this.imageFile);
}

class UploadState extends State<Upload> {
  File imageFile;

  UploadState(this.imageFile);

  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.withOpacity(0.7),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black38,
        child: Icon(Icons.cancel, color: Colors.white),
        mini: true,
        onPressed:() => Navigator.pop(context),
      ),
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
                  onPressed: clear,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: FlatButton(
                  color: Colors.blueGrey,
                  child: Icon(Icons.cloud_upload, color: Colors.white),
                  onPressed: (){ /* TODO UPLOAD FILE */ },
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

  startUpload() {
    String filePath = 'images/${DateTime.now()}.png';

    setState(() {
      //TODO UPLOAD
    });
  }
}