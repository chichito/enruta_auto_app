import 'dart:convert';

Post postFromMap(String str) => Post.fromMap(json.decode(str));

String postToMap(Post data) => json.encode(data.toMap());

class Post {
  int id;
  String title;
  String body;

  Post({required this.id, required this.title, required this.body});

  factory Post.fromMap(Map<String, dynamic> json) =>
      Post(id: json["id"], title: json["title"], body: json["body"]);

  Map<String, dynamic> toMap() => {"id": id, "title": title, "body": body};
}
