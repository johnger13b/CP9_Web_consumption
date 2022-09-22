import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:f_web_consumption/domain/models/post.dart';
import 'package:f_web_consumption/domain/services/placeholder_interface.dart';

class JsonPlaceholderService implements JsonPlaceholderInterface {
  @override
  String get baseUrl => 'jsonplaceholder.typicode.com';

  @override
  Future<List<Post>> fetchPosts() async {
    /* Implementa la logica para consumir del endpoint [GET: /posts] */
    var uri = Uri.https(baseUrl, '/posts');
    final response = await http.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);
      final List<Post> posts = [];
      for (var item in res) {
        posts.add(Post.fromJson(item));
      }
      for (var i = 0; i < 10; i++) {
        posts[i].read = false;
      }
      return posts;
    } else {
      throw Exception('Error in server');
    }
  }

  @override
  Future<void> uploadPost(Post post) async {
/* Implementa la logica para consumir del endpoint [POST: /posts] */
    var uri = Uri.https(baseUrl, '/posts');
    final response = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        post.toMap(), // Convertir el objeto post a un Map json
      ),
    );
    if (response.statusCode != 201) {
      throw Exception('Error in server');
    }
  }
}
