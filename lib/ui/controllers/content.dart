import 'package:f_web_consumption/domain/models/post.dart';
import 'package:f_web_consumption/domain/use_cases/service_manager.dart';
import 'package:get/get.dart';

class ContentController extends GetxController {
  final Rx<List<Post>> _posts = Rx([]);

  List<Post> get posts => _posts.value;

  Future<List<Post>> fetchPosts() async {
    // obten los posts con [PastsManager]
    _posts.value = await PostsManager.fetchPosts();
    return posts;
  }

  Future<void> uploadPost() async {
    // publica un post con [PastsManager]
    await PostsManager.uploadPost();
  }
}
