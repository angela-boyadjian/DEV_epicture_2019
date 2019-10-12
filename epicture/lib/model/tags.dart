import 'dart:convert';

class Tags {
  final String name;
  final String accent;
  final int followers;

  Tags({
    this.name,
    this.accent,
    this.followers,
  });


  factory Tags.fromJson(Map<String, dynamic> json) {
    return new Tags(
        name: json['name'],
        accent: json['accent'],
        followers: json['followers'],
    );
  }
}

List<Tags> parseTags(String responseBody) {
  final parsed = json.decode(responseBody);

  return (parsed["tags"] as List).map<Tags>((json) => 
     new Tags.fromJson(json)).toList();
}