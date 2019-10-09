import 'dart:async';
import 'dart:convert';

class Post {
  final int number;

  Post({this.number});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      number: json['number'],
    );
  }
}