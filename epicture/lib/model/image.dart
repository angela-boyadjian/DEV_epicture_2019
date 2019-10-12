import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:epicture/const.dart';
import 'package:flutter/foundation.dart';
class Imgur {
  final String success;
  final int status;
  final List<ImgurImage> imgurImages;

  Imgur({
    this.success,
    this.status,
    this.imgurImages,
  });

  List<ImgurImage> get images {
    return imgurImages;
  }

  factory Imgur.fromJson(Map<String, dynamic> json) {
    return new Imgur(
      success: json['id'],
      status: json['status'],
      imgurImages: json['data'].map((value) => new ImgurImage.fromJson(value)).toList()
    );
  }
}

class ImgurImage {
  final String title;
  final String link;
  final bool isAlbum;
  final int ups;
  final int downs;
  final String section;
  final String description;

  ImgurImage({
    this.title,
    this.link,
    this.isAlbum,
    this.ups,
    this.downs,
    this.section,
    this.description,
  });

  factory ImgurImage.fromJson(Map<String, dynamic> json) {
    return new ImgurImage(
        title: json['title'],
        link: json['link'],
        isAlbum: json['is_album'],
        ups: json['ups'],
        downs: json['downs'],
        section: json['section'],
        description: json['description'],
    );
  }

  String get linkUrl {
    return link;
  }
}

Future<List<ImgurImage>> getData(http.Client client, int page) async {
  http.Response response = await client.get(
    Uri.encodeFull("https://api.imgur.com/3/gallery/hot/viral/" + page.toString() + ".json"),
    headers: {
      HttpHeaders.authorizationHeader: "Client-ID " + API_KEY,
      "Accept" : "application/json",
    }
  );
  return compute(parsePhotos, response.body);
}

List<ImgurImage> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody);

  var all = (parsed["data"] as List).map<ImgurImage>((json) => 
      new ImgurImage.fromJson(json)).toList();
  List<ImgurImage> img = List<ImgurImage>.from(all);
  img.removeWhere((item) => item.isAlbum == true);
  return img;
}