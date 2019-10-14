import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'dart:io';

import 'services/gallery_viral_services.dart';

const String apiKey = "57a944f493177cd";
const String secret = "6c6de2bdb21487b6b1e5c0a37320ec12e6090db3";

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}


class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  final authorizationEndpoint = Uri.parse("https://imgur.com/oauth2/authorization");
  final tokenEndpoint = Uri.parse("https://imgur.com/oauth2/token");
  final redirectUrl = Uri.parse("https://imgur.com/oauth2-redirect");
  final credentialsFile = new File("./credentialsFile");

  @override
  Widget build(BuildContext context) {
    final grant = new oauth2.AuthorizationCodeGrant(
        apiKey, authorizationEndpoint, tokenEndpoint,
        secret: secret);
    return WebView(
        initialUrl: grant.getAuthorizationUrl(redirectUrl).toString(),
    );
  }
}
