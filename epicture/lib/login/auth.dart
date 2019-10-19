import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

import 'dart:io';
import 'dart:async';

import 'package:epicture/mainTabBar.dart';
import 'package:epicture/const.dart';

final authorizationEndpoint = Uri.parse("https://api.imgur.com/oauth2/authorize?client_id=" +
  Constants.API_KEY + "&response_type=token&state=Epicture");
final tokenEndpoint = Uri.parse("https://api.imgur.com/oauth2/token");
final redirectUrl = Uri.parse("http://localhost/token");

class Auth extends StatefulWidget {
  @override
  AuthState createState() => AuthState();
}

class AuthState extends State<Auth> {
  oauth2.Client client;

  final credentialsFile = new File("./credentialsFile");
  String newUrl;

  var grant = new oauth2.AuthorizationCodeGrant(
    Constants.API_KEY, authorizationEndpoint,
    tokenEndpoint, secret: Constants.API_SECRET);

  void initState() {
    newUrl = grant.getAuthorizationUrl(redirectUrl).toString();
    super.initState();
  }

  get clientObj {
    return client;
  }

  Future<oauth2.Client> getClient(String req) async {
    if (req.contains("code=")) {
      return await grant.handleAuthorizationResponse(Uri.parse(req).queryParameters);
    }
    return null;
  }

  void pageFinished(String req, BuildContext context) async {
    client = await getClient(req);

    if (client != null) {
      Navigator.push(context, new MaterialPageRoute(
              builder: (context) => MainTabBar(client),
      ),);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container (
      child: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: newUrl,
        onPageFinished: (url) { pageFinished(url, context); },
        ),
    );
  }
}