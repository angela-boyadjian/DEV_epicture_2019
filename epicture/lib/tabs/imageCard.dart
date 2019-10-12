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

  Widget get imageCard {
    return new Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Center(child: Text(photo.title, style: TextStyle(fontWeight: FontWeight.bold))),
            new CachedNetworkImage(imageUrl: photo.link),
            new ButtonTheme.bar(
              child: new ButtonBar(
                children: <Widget>[
                  new FlatButton(
                    child:  Icon(
                      Icons.favorite,
                      color: Colors.pink,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                    onPressed: (){ /*DO STUFF*/ },
                  ),
                  new FlatButton(
                    child:  Icon(
                      Icons.message,
                      color: Colors.blue,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                    onPressed: (){ /*DO STUFF*/ },
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