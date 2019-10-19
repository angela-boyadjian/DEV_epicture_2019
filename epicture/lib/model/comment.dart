 
import 'dart:convert';

class Comment {
  final int id;
  final String comment;
  final String author;
  final List<Comment> replies;
  String vote;
  int points;

  Comment({this.id, this.comment, this.author, this.replies, this.vote, this.points});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      comment: json['comment'],
      author: json['author'],
      replies: parseReplies(json),
      vote: json['vote'],
      points: json['points'],
    );
  }


}

List<Comment> parseComments(String responseBody) {
  var parsed = json.decode(responseBody);

  return (parsed['data'] as List).map<Comment>((json) =>
     new Comment.fromJson(json)).toList();
  // return decodedJson['data'].cast<Map<String, dynamic>>().map((obj) => Comment.fromJson(obj)).toList().cast<Comment>();
}

List<Comment> parseReplies(Map<String, dynamic> json) {
return json['children'].cast<Map<String, dynamic>>().map((obj) => Comment.fromJson(obj)).toList().cast<Comment>();
}