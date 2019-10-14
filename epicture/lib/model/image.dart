import 'dart:convert';

import 'tags.dart';
import 'album.dart';

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
  final int commentCount;
  final int views;
  List<dynamic> tags;

  ImgurImage({
    this.title,
    this.link,
    this.isAlbum,
    this.ups,
    this.downs,
    this.section,
    this.description,
    this.commentCount,
    this.views,
    this.tags,
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
        commentCount: json['comment_count'],
        views: json['views'],
        tags: json['tags'],
    );
  }

  String get linkUrl {
    return link;
  }
}

List<ImgurImage> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody);
  
  var all = (parsed["data"] as List).map<ImgurImage>((json) => 
     new ImgurImage.fromJson(json)).toList();
  List<ImgurImage> img = List<ImgurImage>.from(all);
  img.removeWhere((item) => item.isAlbum == true);
  return img;
}

// FIXME Images not display error codec
List<ImgurImage> parseFavorite(String responseBody) {
  final parsed = json.decode(responseBody);

  var all = (parsed["data"] as List).map<ImgurImage>((json) => 
     new ImgurImage.fromJson(json)).toList();
  return all;
}