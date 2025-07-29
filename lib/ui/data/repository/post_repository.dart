import 'package:dio/dio.dart';
import 'package:enruta_auto_app/ui/home/model/post.dart';

class PostRepository {
  final String apiUrl;
  late final Dio _dio;

  PostRepository({required this.apiUrl}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: apiUrl,
        connectTimeout: const Duration(seconds: 90),
        receiveTimeout: const Duration(seconds: 90),
      ),
    );
  }

  //final String apiUrl = globalapiUrl;
  /*
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
  */
  Future<List<Post>> fetchPosts() async {
    final response = await _dio.get('/posts');
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = response.data["posts"];
      return jsonResponse
          .map((post) => Post.fromMap(post as Map<String, dynamic>))
          .toList();
    } else if (response.statusCode == 404) {
      throw Exception('Error: User not found.');
    } else if (response.statusCode == 500) {
      throw Exception('Error: Internal server error.');
    } else {
      throw Exception('Error: Unexpected error occurred.');
    }
  }

  Future<String> getEstado() async {
    final response = await _dio.get('/Enrutamiento');
    if (response.statusCode == 200) {
      String jsonResponse = response.data;
      return jsonResponse;
    } else if (response.statusCode == 404) {
      throw Exception('Error: User not found.');
    } else if (response.statusCode == 500) {
      throw Exception('Error: Internal server error.');
    } else {
      throw Exception('Error: Unexpected error occurred.');
    }
  }
}
