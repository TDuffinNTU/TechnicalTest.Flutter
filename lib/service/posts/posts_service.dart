import 'package:flutter_tech_task/repository/data_sources/database/api_client.dart';
import 'package:flutter_tech_task/repository/data_sources/database/api_controller.dart';
import 'package:flutter_tech_task/repository/models/posts/post_model.dart';
import 'package:flutter_tech_task/service/common/mapper_mixin.dart';
import 'package:flutter_tech_task/service/posts/post.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'posts_service.g.dart';

@riverpod
class PostsService extends _$PostsService with MapperMixin<Post, PostModel> {
  @override
  FutureOr<List<Post>> build() async {
    final List<PostModel> posts = await ApiController(
      client: ApiClient(),
    ).getAllPosts();

    return posts.map(fromRepository).toList();
  }

  @override
  Post fromRepository(PostModel post) {
    return Post(
      id: post.id,
      userId: post.userId,
      title: post.title,
      body: post.body,
      // Does nothing for now.
      offline: false,
    );
  }

  @override
  PostModel toRepository(Post post) {
    return PostModel(
      id: post.id,
      userId: post.userId,
      title: post.title,
      body: post.body,
    );
  }
}
