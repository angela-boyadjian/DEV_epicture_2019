import 'package:flutter/material.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

import 'searchImg.dart';

class SearchPage extends StatefulWidget {
  oauth2.Client client;  

  SearchPage(this.client);
  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  Icon searchIcon = Icon(Icons.search);

  @override
  Widget build(BuildContext context) {
    return SearchImg(widget.client);
  }
}