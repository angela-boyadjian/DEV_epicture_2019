import 'package:epicture/model/account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

//import 'package:epicture/model/account.dart';
import 'package:epicture/model/requests.dart';

class About extends StatefulWidget {
  oauth2.Client client;

  About(this.client);

  @override
  AboutState createState() => new AboutState();
}

class AboutState extends State<About> with SingleTickerProviderStateMixin {
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
            return aboutPage(snapshot.data);
          }
          return loadingPage();
        });
  }

  Widget loadingPage() {
    return Center(child: new CircularProgressIndicator());
  }

  Widget RowCard() {
    return Card(
        child: IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            color: Colors.black54,
          ),
        ],
      ),
    ));
  }

  Widget aboutPage(Account account) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                margin: EdgeInsets.all(10.0),
                child: Center(
                    child: Column(
                  children: <Widget>[
                    Text(
                      account.data.reputation_name,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 25,
                        letterSpacing: 0.8,
                      ),
                    ),
                    Text(
                      account.data.reputation.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.green,
                        fontSize: 25,
                        letterSpacing: 0.8,
                      ),
                    )
                  ],
                )),
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.all(
                      const Radius.circular(20.0),
                    ))),
            Container(
              margin: EdgeInsets.all(10.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text("Posts"),
                    Text("Favorites"),
                    Text("Comments")
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.all(
                    const Radius.circular(20.0),
                  )),
              height: 100,
            ),
            Container(
                margin: EdgeInsets.all(10.0),
                child: Center(
                    child: Text((account.data.bio != null
                        ? account.data.bio
                        : "A fun bio about you goes here. Add one!"))),
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.all(
                      const Radius.circular(20.0),
                    ))),
          ],
        ));
  }
}
