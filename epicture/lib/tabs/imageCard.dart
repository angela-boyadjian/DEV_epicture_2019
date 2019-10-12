import 'package:flutter/material.dart';
import 'package:epicture/model/image.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageCard extends StatefulWidget {
  final ImgurImage photo;
  ImageCard(this.photo);

  @override
  State<StatefulWidget> createState() {
    return ImageCardState(photo);
  }
}

class ImageCardState extends State<ImageCard> {
  ImgurImage photo;
  String renderUrl;
  ImageCardState(this.photo);
  Color favColor = Colors.grey;
  bool isFav = false;
  Color upColor = Colors.grey;
  bool isUp = false;

  Widget get imageCard {
    return new Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Center(child: Text(photo.title, style: TextStyle(height: 1, fontSize: 20, fontWeight: FontWeight.bold))),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
              Text(photo.views.toString(), style: TextStyle(color: Colors.grey)),
              Icon(Icons.remove_red_eye, color: Colors.grey),
            ],),
            new CachedNetworkImage(imageUrl: photo.link),
            new ButtonTheme.bar(
              child: new ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  new FlatButton.icon(
                      icon: Icon(Icons.arrow_upward, color: upColor),
                      label: Text(photo.ups.toString(), style: TextStyle(color: Colors.grey)),
                      onPressed: () { setState(() {
                        if (isUp) {
                          upColor = Colors.grey;
                          isUp = false;
                        } else {
                          upColor = Colors.green;
                          isUp = true;
                        }
                      });},
                  ),
                  new FlatButton.icon(
                      icon: Icon(Icons.comment, color: Colors.grey),
                      label: Text(photo.commentCount.toString(), style: TextStyle(color: Colors.grey)),
                      onPressed: () {}
                  ),
                  new FlatButton.icon(
                      icon: Icon(Icons.favorite, color: favColor),
                      label: Text("42", style: TextStyle(color: Colors.grey)),
                      onPressed: () { setState(() {
                        if (isFav) {
                          favColor = Colors.grey;
                          isFav = false;
                        } else {
                          favColor = Colors.pink;
                          isFav = true;
                        }
                      });},
                  ),
                  new IconButton(
                      icon: Icon(Icons.share, color: Colors.grey),
                      onPressed: () { },
                  ),
                ],
              ),
            ),
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