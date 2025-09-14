import 'package:flutter_tech_task/repository/models/posts/post_model.dart';
import 'package:flutter_tech_task/service/common/mapper_mixin.dart';
import 'package:flutter_tech_task/service/posts/post.dart';

class PostsMapper with MapperMixin<Post, PostModel> {
  @override
  Post fromRepository(PostModel post, {bool? cached}) {
    return Post(
      id: post.id,
      userId: post.userId,
      title: post.title,
      body: post.body,
      offline: cached ?? false,
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

  @override
  List<Post> fromRepositoryList(
    List<PostModel> repoType, {
    List<PostModel>? cachedPosts,
  }) {
    if (cachedPosts != null) {
      final apiSet = Set.from(repoType.map(fromRepository));
      final cacheSet = Set.from(
        cachedPosts.map((e) => fromRepository(e, cached: true)),
      );
      final diffSet = apiSet.difference(cacheSet);
      return List<Post>.from(diffSet);
    } else {
      return super.fromRepositoryList(repoType);
    }
  }
}
