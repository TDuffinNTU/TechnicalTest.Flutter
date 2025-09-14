import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_service.g.dart';

@riverpod
class RepositoryService extends _$RepositoryService {
  @override
  Future<void> build() {
    throw UnimplementedError();
  }

  // final PostsMapper postsMapper = PostsMapper();
  // final CommentMapper commentMapper = CommentMapper();

  // Future<List<Post>> getPosts() async {
  //   List<PostModel> cacheResults = [];
  //   List<PostModel> apiResults = [];

  //   cacheResults = await databaseController.getPosts();
  //   apiResults = await apiController.getAllPosts();

  //   return postsMapper.fromRepositoryList(
  //     apiResults,
  //     cachedPosts: cacheResults,
  //   );
  // }
}
