import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:epicture/model/image.dart';

class ImageTags extends StatefulWidget {
  final ImgurImage photo;

  ImageTags(this.photo);
  @override
  State<StatefulWidget> createState() => ImageTagsState();
}

class ImageTagsState extends State<ImageTags> {
  List<String> tags = [];
  bool one = false;
  bool two = false;
  bool three = false;

  Widget get getTags {
    initTags();
    return new Wrap(
      spacing: 5.0,
      direction: Axis.horizontal,
      children: <Widget>[
        Visibility(
          child: Chip(
            label: new Text(tags.length >= 1 ? tags[0] : ""),
            backgroundColor: Colors.pink,
          ),
          visible: one,
        ),
        Visibility(
          child: Chip(
            label: new Text(tags.length >= 2 ? tags[1] : ""),
            backgroundColor: Colors.blue,
          ),
          visible: two,
        ),
        Visibility(
          child: Chip(
            label: new Text(tags.length >= 3 ? tags[2] : ""),
            backgroundColor: Colors.yellow,
          ),
          visible: three,
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return new Container(
      child: getTags,
    );
  }

  void initTags() async {
    if (widget.photo.tags.length == 0)
      return;
    if (widget.photo.tags.length >= 1)
      one = true;
    if (widget.photo.tags.length >= 2)
      two = true;
    if (widget.photo.tags.length >= 3)
      three = true;
    for (var items in widget.photo.tags) {
      this.tags.add(items['name'].toString());
    }
  }
}