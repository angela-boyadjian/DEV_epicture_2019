import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/widgets.dart';

class ImageCapture extends StatefulWidget {
  @override
  ImageCapture();

  ImageCaptureState createState() => ImageCaptureState();
}

class ImageCaptureState extends State<ImageCapture> {
  File imageFile;

  ImageCaptureState();

  Widget get bottomBar {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black38,
        child: Icon(Icons.cancel, color: Colors.white),
        mini: true,
        onPressed: (){
          Navigator.pop(context);
      },),
        bottomNavigationBar: BottomAppBar(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.photo_camera,
                size: 30,
              ),
              onPressed: () => pickImage(ImageSource.camera),
              color: Colors.blue,
            ),
            IconButton(
              icon: Icon(
                Icons.photo_library,
                size: 30,
              ),
              onPressed: () => pickImage(ImageSource.gallery),
              color: Colors.pink,
            ),
          ],
        ),
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
                  color: Colors.black,
                  child: Icon(Icons.crop),
                  onPressed: cropImage,
                ),
                FlatButton(
                  color: Colors.black,
                  child: Icon(Icons.refresh),
                  onPressed: clear,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Uploader(
                file: imageFile,
              ),
            )
          ]
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child:  bottomBar,
    );
  }

  // NOTE Select an image via gallery or camera
  Future<void> pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);
    setState(() {
      imageFile = selected;
    });
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

class Uploader extends StatefulWidget {
  final File file;

  Uploader({Key key, this.file}) : super(key: key);

  UploaderState createState() => UploaderState();
}

class UploaderState extends State<Uploader> {

  startUpload() {
    String filePath = 'images/${DateTime.now()}.png';

    setState(() {
    });
  }

  @override
   @override
  Widget build(BuildContext context) {
  }
}
