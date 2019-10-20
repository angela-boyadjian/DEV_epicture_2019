import 'dart:convert';

class Album {
  final String id;
  final int status;
  final int imagesCount;
  final String cover;

  Album({
    this.id,
    this.status,
    this.imagesCount,
    this.cover,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return new Album(
      id: json['id'],
      status: json['status'],
      imagesCount: json['images_count'],
      cover: json['cover'],
    );
  }
}

List<Album> parseAlbum(String responseBody) {
  final parsed = json.decode(responseBody);
  return (parsed["data"] as List).map<Album>((json) => 
     new Album.fromJson(json)).toList();
}