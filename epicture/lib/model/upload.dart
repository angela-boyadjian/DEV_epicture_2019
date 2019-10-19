import 'dart:io';

class ImageToPost {
  final File image;
  final String title;
  final String description;

  ImageToPost(
    this.image,
    this.title,
    this.description,
  );
}