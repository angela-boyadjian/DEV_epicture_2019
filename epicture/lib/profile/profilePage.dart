import 'package:flutter/material.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

import 'package:epicture/profile/posts.dart';
import 'package:epicture/profile/comments.dart';
import 'package:epicture/profile/about.dart';
import 'package:epicture/profile/following.dart';
import 'package:epicture/model/requests.dart';


import 'package:epicture/home/imageCapture.dart';
import 'package:epicture/model/account.dart';

class ProfilePage extends StatefulWidget {
  oauth2.Client client;

  ProfilePage(this.client);
  @override
  ProfilePageState createState() => new ProfilePageState();
 }

class ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {

  Future<Account> gettingAccount() {
    return getAccountBase(widget.client);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Account>(
        future: gettingAccount(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          if (snapshot.hasData) {
            return profile(snapshot.data);
          }
          return loadingPage();
        }
    );
  }

  Widget loadingPage() {
    return Center(
        child: new CircularProgressIndicator()
    );
  }

  Widget circleImage(String url) {
    return CircleAvatar(
      backgroundImage: Image.network(url).image,
    );
  }

  Widget profile(Account account) {
    return MaterialApp(
        home: DefaultTabController(
            length: 4,
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  bottom: TabBar(
                    tabs: [
                      Tab(text: 'Posts'),
                      Tab(text: 'Following'),
                      Tab(text: 'Comments'),
                      Tab(text: 'About')
                    ],
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      circleImage(account.data.avatar),
                      Spacer(),
                      Text(account.data.url),
                    ],
                  ),
                  flexibleSpace: Image.network(
                      account.data.cover,
                      fit: BoxFit.cover,
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(
                          Icons.share
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                          Icons.settings
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(context, new MaterialPageRoute(
                          builder: (context) => ImageCapture(widget.client),
                        ),);
                      },
                      icon: Icon(
                        Icons.add_a_photo,
                      ),
                    )
                  ],
                ),
                body: TabBarView(
                  children: [
                    Posts(widget.client),
                    Comments(),
                    Following(),
                    About(widget.client),
                  ],
                )
            )));
  }
}
