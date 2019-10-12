import 'package:flutter/material.dart';

import 'searchImg.dart';

class SearchPage extends StatefulWidget {
  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  Icon searchIcon = Icon(Icons.search);

  @override
  Widget build(BuildContext context) {
    return SearchImg();
  }
}