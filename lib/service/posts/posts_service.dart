import 'package:flutter_tech_task/repository/data_sources/api/api_client.dart';
import 'package:flutter_tech_task/repository/data_sources/api/api_controller.dart';
import 'package:flutter_tech_task/repository/data_sources/database/database.dart';
import 'package:flutter_tech_task/repository/data_sources/database/database_controller.dart';
import 'package:flutter_tech_task/repository/models/posts/post_model.dart';
import 'package:flutter_tech_task/service/posts/post.dart';
import 'package:flutter_tech_task/service/posts/posts_mapper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'posts_service.g.dart';

@riverpod
FutureOr<List<Post>> postsService(Ref ref) async {
  final PostsMapper mapper = PostsMapper();
  final DatabaseController db = DatabaseController(
    database: await ref.watch(getDatabaseProvider.future),
  );
  final ApiController api = ApiController(
    client: await ref.watch(apiClientProvider.future),
  );
  ref.keepAlive();
  List<PostModel> cacheResults = [];
  List<PostModel> apiResults = [];

  cacheResults = await db.getPosts();
  apiResults = await api.getAllPosts();

  return mapper.fromRepositoryList(apiResults, cachedPosts: cacheResults);
}

@riverpod
Future<void> storePost(Ref ref, Post post) async {
  final PostsMapper mapper = PostsMapper();
  await DatabaseController(
    database: await ref.watch(getDatabaseProvider.future),
  ).storePost(mapper.toRepository(post));
}
