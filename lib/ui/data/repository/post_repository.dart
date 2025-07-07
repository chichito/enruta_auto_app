import 'dart:convert';

import 'package:enruta_auto_app/ui/home/model/post.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  final String apiUrl = "https://dummyjson.com/posts";

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)["posts"];
      return jsonResponse.map((post) => Post.fromMap(post)).toList();
    } else if (response.statusCode == 404) {
      throw Exception('Error: User not found.');
    } else if (response.statusCode == 500) {
      throw Exception('Error: Internal server error.');
    } else {
      throw Exception('Error: Unexpected error occurred.');
    }
  }
}
