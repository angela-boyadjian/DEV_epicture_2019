 
import 'dart:convert';

class Comment {
  final int id;
  final String comment;
  final String author;
  final int ups;
  final int downs;
  final int datetime;

  // final List<Comment> replies;
  String vote;
  int points;

  Comment({
    this.id,
    this.comment,
    this.author,
    // this.replies,
    this.vote,
    this.points,
    this.ups,
    this.downs,
    this.datetime,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      comment: json['comment'],
      author: json['author'],
      // replies: parseReplies(json),
      vote: json['vote'],
      points: json['points'],
      ups: json['ups'],
      downs: json['downs'],
      datetime: json['datetime'],
    );
  }


}

List<Comment> parseComments(String responseBody) {
  var parsed = json.decode(responseBody);

  return (parsed['data'] as List).map<Comment>((json) =>
     new Comment.fromJson(json)).toList();
}

List<Comment> parseReplies(Map<String, dynamic> json) {
  return json['children'].cast<Map<String, dynamic>>().map((obj) => Comment.fromJson(obj)).toList().cast<Comment>();
}