import 'dart:io';
import 'package:epicture/model/account.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

import 'package:epicture/const.dart';
import 'image.dart';
import 'account.dart';
import 'upload.dart';
import 'album.dart';
import 'comment.dart';

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
Future<List<ImgurImage>> getSearchData(oauth2.Client client, String searchText, int page) async {
    var response = await client.get('https://api.imgur.com/3/gallery/search/hot/' + page.toString() +
      '?client_id=' + Constants.API_KEY + '&album_previews=true&mature=true&q=' + searchText);
    return compute(parsePhotos, response.body);
}

// NOTE Upload file
void postImage(oauth2.Client client, ImageToPost imgObj) async {
  List<int> imageBytes = await imgObj.image.readAsBytesSync();
  String base64Image = base64Encode(imageBytes);
  await client.post('https://api.imgur.com/3/image?client_id=' + Constants.API_KEY,
  body: {"image": base64Image, "title": imgObj.title, "description": imgObj.description});
}

// NOTE Get user favorites
Future<List<ImgurImage>> getFavorite(oauth2.Client client) async {
  var response = await client.get("https://api.imgur.com/3/account/me/favorites/0");

  return compute(parseAlbum, response.body);
}

// NOTE Get User Name
Future<Account> getAccountBase(oauth2.Client client) async {
  var response = await client.get("https://api.imgur.com/3/account/me");

  return compute(parseAccount, response.body);
}

Future<List<ImgurImage>> getPosts(oauth2.Client client) async {
  var response = await client.get("https://api.imgur.com/3/account/me/submissions/");

  return compute(parseAlbum, response.body);
}

// NOTE Get comments for given image
Future<List<Comment>> getComments(oauth2.Client client, String id) async {
  // FIXME Client is null -> Connection refused ?
  var response = await http.get(
    'https://api.imgur.com/3/gallery/' + id + '/comments?client_id=' + Constants.API_KEY,
    headers: {
      HttpHeaders.authorizationHeader: "Client-ID " + Constants.API_KEY,
      "Accept" : "application/json",
    }
  );
  return compute(parseComments, response.body);
}

void getSubmissions(oauth2.Client client) async {
  var response = await client.get("https://api.imgur.com/3/account/me/submissions/0");

  print(response.toString());
}
