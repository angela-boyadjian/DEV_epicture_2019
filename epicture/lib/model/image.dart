import 'dart:convert';

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
  final String id;
  final String title;
  final String link;
  final bool isAlbum;
  final int ups;
  final int downs;
  final String section;
  final String description;
  final int commentCount;
  final int favoriteCount;
  final bool favorite;
  final int views;
  final String accountUrl;
  final int datetime;
  List<dynamic> tags;

  ImgurImage({
    this.id,
    this.title,
    this.link,
    this.isAlbum,
    this.ups,
    this.downs,
    this.section,
    this.description,
    this.commentCount,
    this.favoriteCount,
    this.favorite,
    this.views,
    this.tags,
    this.accountUrl,
    this.datetime,
  });

  factory ImgurImage.fromJson(Map<String, dynamic> json) {
    // if (json['type'] != 'video/mp4') {
      return ImgurImage(
          id: json['id'],
          title: json['title'],
          link: json['link'],
          isAlbum: json['is_album'],
          ups: json['ups'],
          downs: json['downs'],
          section: json['section'],
          description: json['description'],
          commentCount: json['comment_count'],
          favoriteCount: json['favorite_count'],
          favorite: json['favorite' ?? false],
          views: json['views'],
          tags: json['tags'],
          accountUrl: json['account_url'],
          datetime: json['datetime'],
      );
    // }
    // return null;
  }

  String get linkUrl {
    return link;
  }
}

List<ImgurImage> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody);
  
  var all = (parsed['data'] as List).map<ImgurImage>((json) =>
     new ImgurImage.fromJson(json)).toList();
  List<ImgurImage> img = List<ImgurImage>.from(all);
  img.removeWhere((item) => item.isAlbum == true);
  return img;
}

List<ImgurImage> parseTags(String responseBody) {
  final parsed = json.decode(responseBody);

  return (parsed['data']['items'] as List).map<ImgurImage>((json) =>
  new ImgurImage.fromJson(json)).toList();
}

List<ImgurImage> parsePosts(String responseBody) {
  final parsed = json.decode(responseBody);

  var all = (parsed["data"] as List).map<ImgurImage>((json) =>
  new ImgurImage.fromJson(json)).toList();
  return all;
}