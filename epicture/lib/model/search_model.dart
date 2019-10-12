import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
import 'package:epicture/const.dart';
import 'package:flutter/foundation.dart';

import 'image.dart';

Future<List<ImgurImage>> getSearchData(http.Client client, String searchTerm) async {
  http.Response response = await client.get(
    Uri.encodeFull("https://api.imgur.com/3/gallery/search/?q=/" + searchTerm),
    headers: {
      HttpHeaders.authorizationHeader: "Client-ID " + API_KEY,
      "Accept" : "application/json",
    }
  );
  return compute(parsePhotos, response.body);
}