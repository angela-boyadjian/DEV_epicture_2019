import 'package:epicture/images/photosGrid.dart';
import 'package:epicture/model/image.dart';
import 'package:epicture/model/requests.dart';
import 'package:flutter/material.dart';
import 'package:oauth2/oauth2.dart' as oauth2;


class Posts extends StatefulWidget {
  oauth2.Client client;

  Posts(this.client);
  @override
  PostsState createState() => new PostsState();
}

class PostsState extends State<Posts> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ImgurImage>>(
        future: gettingPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          if (snapshot.hasData) {
            return PhotosGrid(photos: snapshot.data);
          }
          return loadingPage();
        }
    );
  }

  Future<List<ImgurImage>> gettingPosts() {
    return getPosts(widget.client);
  }

  Widget loadingPage() {
    return Center(
        child: new CircularProgressIndicator()
    );
  }

  Widget posts() {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('yes'),
                  color: Colors.grey[100],
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}
