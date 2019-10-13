import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/widgets.dart';

import 'upload.dart';

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
        onPressed: () => Navigator.pop(context),
      ),
      body: SizedBox.expand(
        child: Container(
          color: Colors.black.withOpacity(0.8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(5),
                  height: 120, width: 150,
                  color: Colors.blueGrey,
                  child: IconButton(
                    icon: Icon(Icons.photo_camera, color: Colors.white, size: 60),
                    onPressed: () {
                      pickImage(ImageSource.camera);
                      if (imageFile != null) {
                        Navigator.push(context, new MaterialPageRoute(
                          builder: (context) => Upload(imageFile: imageFile)));
                      }
                    }
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(5),
                  height: 120, width: 150,
                  color: Colors.indigo,
                  child: IconButton(
                    icon: Icon(Icons.file_upload, color: Colors.white, size: 60),
                    onPressed: () {
                      pickImage(ImageSource.gallery);
                      Navigator.push(context, new MaterialPageRoute(
                        builder: (context) => Upload(imageFile: imageFile)));
                    }
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(5),
                  height: 120, width: 150,
                  color: Colors.deepPurple,
                  child: IconButton(
                    icon: Icon(Icons.http, color: Colors.white, size: 60),
                     onPressed: () {},
                    ),
                ),
              ),
            ],
          ),
        ),
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
}