import 'package:flutter_tech_task/repository/comments/comment.dart';
import 'package:flutter_tech_task/repository/common/api_controller.dart';
import 'package:flutter_tech_task/repository/common/api_client.dart';
import 'package:flutter_tech_task/repository/common/response_parsers.dart';
import 'package:flutter_tech_task/repository/posts/post.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../utils/example_responses.dart';

import 'api_client_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ApiClient>()])
void main() {
  late MockApiClient mockApiClient;

  final commentsResponse = decodeFile(getCommentsSuccessJson);
  final singlePostResponse = decodeFile(getSinglePostSuccessJson);
  final allPostsResponse = decodeFile(getAllPostsSuccessJson);

  setUp(() {
    mockApiClient = MockApiClient();
  });

  group('GET /post/{id}/comments', () {
    test('GET post/id/comments success', () async {
      when(
        mockApiClient.getRequest(argThat(contains('posts')), any),
      ).thenAnswer((_) async => commentsResponse);

      final comments = parseListResponse<Comment>(
        commentsResponse,
        Comment.fromJson,
      );

      final controller = ApiController(client: mockApiClient);
      final data = await controller.getComments(null, postId: '1');

      expect(data, equals(comments));
    });
  });

  group('GET /posts', () {
    setUp(() {
      when(
        mockApiClient.getRequest(argThat(contains('posts/1')), any),
      ).thenAnswer((_) async => singlePostResponse);

      when(
        mockApiClient.getRequest(argThat(isNot(contains('posts/1'))), any),
      ).thenAnswer((_) async => allPostsResponse);
    });

    test('GET post/id success', () async {
      final singlePost = parseSingleResponse(singlePostResponse, Post.fromJson);

      final controller = ApiController(client: mockApiClient);
      final result = await controller.getSinglePost(null, postId: '1');

      expect(result, equals(singlePost));
    });

    test('GET posts success', () async {
      final allPosts = parseListResponse(allPostsResponse, Post.fromJson);

      final controller = ApiController(client: mockApiClient);
      final result = await controller.getAllPosts(null);

      expect(result, equals(allPosts));
    });
  });
}
