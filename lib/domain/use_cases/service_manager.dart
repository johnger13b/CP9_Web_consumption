import 'dart:math';

import 'package:f_web_consumption/data/services/json_placeholder.dart';
import 'package:f_web_consumption/domain/models/post.dart';

abstract class PostsManager {
  static final _service = JsonPlaceholderService();
  static final _random = Random();

  static Future<List<Post>> fetchPosts() async {
    /* retorna la lista de posts */
    return await _service.fetchPosts();
  }

  static Future<void> uploadPost() async {
    /* crea y sube un post */
    final nuevoPost = Post(
      id: _random.nextInt(100),
      userId: _random.nextInt(100),
      title: 'My title',
      body: 'My body',
    );
    await _service.uploadPost(nuevoPost);
  }
}
