import 'dart:convert';

import 'image.dart';

class Album {
  final String success;
  final int status;
  final int imagesCount;
  final List<ImgurImage> images;

  Album({
    this.success,
    this.status,
    this.imagesCount,
    this.images,
  });

  get getImages { return this.images; }

  factory Album.fromJson(Map<String, dynamic> json) {
    return new Album(
      success: json['id'],
      status: json['status'],
      imagesCount: json['images_count'],
      images: parsePhotos(json['images']),
    );
  }
}

List<ImgurImage> parseAlbum(String responseBody) {
  final parsed = json.decode(responseBody);
  return (parsed["data"] as List).map<ImgurImage>((json) => 
     new ImgurImage.fromJson(json)).toList();
}