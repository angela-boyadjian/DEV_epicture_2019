import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

import 'package:epicture/const.dart';
import 'image.dart';
import 'tags.dart';

// NOTE Get data from gallery hot viral
Future<List<ImgurImage>> getData(http.Client client, int page) async {
  http.Response response = await client.get(
    Uri.encodeFull("https://api.imgur.com/3/gallery/hot/viral/" + page.toString() + ".json"),
    headers: {
      HttpHeaders.authorizationHeader: "Client-ID " + Constants.API_KEY,
      "Accept" : "application/json",
    }
  );
  return compute(parsePhotos, response.body);
}

// NOTE Get data from search term
Future<List<ImgurImage>> getSearchData(http.Client client, String searchTerm) async {
  http.Response response = await client.get(
    Uri.encodeFull("https://api.imgur.com/3/gallery/search/?q=/" + searchTerm),
    headers: {
      HttpHeaders.authorizationHeader: "Client-ID " + Constants.API_KEY,
      "Accept" : "application/json",
    }
  );
  return compute(parsePhotos, response.body);
}

// TODO Upload file

// NOTE Get user favorites
Future<List<ImgurImage>> getFavorite(oauth2.Client client) async {
  var response = await client.get("https://api.imgur.com/3/account/me/favorites/0");

  return compute(parseFavorite, response.body);
}