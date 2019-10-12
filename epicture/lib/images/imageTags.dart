import 'package:flutter/material.dart';

import 'package:epicture/model/image.dart';

class ImageTags extends StatefulWidget {
  final ImgurImage photo;
  ImageTags(this.photo);

  @override
  State<StatefulWidget> createState() {
    return ImageTagsState(photo);
  }
}

class ImageTagsState extends State<ImageTags> {
  ImgurImage photo;

  ImageTagsState(this.photo);

  Widget get imageTags {
    return new Wrap(
      spacing: 5.0,
      direction: Axis.horizontal,
      children: <Widget>[
        Chip(
          label: new Text("funny"),
          backgroundColor: Colors.pink,
        ),
        Chip(
          label: new Text("cat"),
          backgroundColor: Colors.blue,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child:  imageTags,
    );
  }
}