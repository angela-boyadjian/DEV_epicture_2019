import 'package:flutter/material.dart';

class Upload extends StatefulWidget {
  @override
  UploadState createState() => new UploadState();
}

            // fit: BoxFit.fitHeight,
class UploadState extends State<Upload> {
  Widget build (BuildContext context) {
    return Scaffold(
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
                    onPressed: (){},
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
                    onPressed: (){},
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
                    onPressed: (){},
                    ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black38,
        child: Icon(Icons.cancel, color: Colors.white),
        mini: true,
        onPressed: (){
          Navigator.pop(context);
      },),
    );
  }
}