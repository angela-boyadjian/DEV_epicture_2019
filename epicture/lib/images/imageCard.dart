import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:intl/intl.dart';

import 'package:epicture/model/image.dart';
import 'imageBar.dart';
import 'imageTags.dart';

class ImageCard extends StatefulWidget {
  final ImgurImage photo;
  oauth2.Client client;
  bool isCommentPage;

  ImageCard(this.client, this.photo, this.isCommentPage);
  @override
  State<StatefulWidget> createState() => ImageCardState(photo);
}

class ImageCardState extends State<ImageCard> {
  ImgurImage photo;
  String renderUrl = "";
  Color favColor = Colors.white;
  bool isFav = false;
  Color upColor = Colors.white;
  bool isUp = false;

  ImageCardState(this.photo);

  Widget get imageCard {
    return new Card(
      color: Colors.black54,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
               Text(photo.accountUrl == null ? "Anonymous" : photo.accountUrl, style: TextStyle(color: Colors.white)),
             ], 
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
               Text(getTime(photo.datetime), style: TextStyle(color: Colors.white)),
             ], 
            ),
            Center(child: Text(photo.title == null ? " " : photo.title, style: TextStyle(color: Colors.white, height: 1,
              fontSize: 20, fontWeight: FontWeight.bold))),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
              Text(photo.views.toString(), style: TextStyle(color: Colors.white)),
              Icon(Icons.remove_red_eye, color: Colors.white),
            ],),
            new CachedNetworkImage(imageUrl: photo.link),
            new ImageTags(photo),
            new ImageBar(client: widget.client, photo: photo, isCommentPage: widget.isCommentPage),
          ],
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child:  imageCard,
    );
  }
}

String getTime(int timestamp) {
  var now = new DateTime.now();
  var format = new DateFormat('HH:mm a');
  var date = new DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000);
  var diff = date.difference(now);
  var time = '';

  if (diff.inSeconds <= 0 || diff.inSeconds > 0 && diff.inMinutes == 0 || diff.inMinutes > 0 && diff.inHours == 0 || diff.inHours > 0 && diff.inDays == 0) {
    time = format.format(date);
  } else {
    if (diff.inDays == 1) {
      time = diff.inDays.toString() + 'DAY AGO';
    } else {
      time = diff.inDays.toString() + 'DAYS AGO';
    }
  }
  return time;
}