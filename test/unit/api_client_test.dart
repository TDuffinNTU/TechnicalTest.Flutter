// import 'package:flutter_tech_task/repository/models/comments/comment_model.dart';
// import 'package:flutter_tech_task/repository/data_sources/api/api_controller.dart';
// import 'package:flutter_tech_task/repository/common/response_parsers.dart';
// import 'package:flutter_tech_task/repository/models/posts/post_model.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// import '../utils/example_responses.dart';

// import 'api_client_test.mocks.dart';

// void main() {
//   late MockApiClient mockApiClient;

//   final commentsResponse = decodeFile(getCommentsSuccessJson);
//   final singlePostResponse = decodeFile(getSinglePostSuccessJson);
//   final allPostsResponse = decodeFile(getAllPostsSuccessJson);

//   setUp(() {
//     mockApiClient = MockApiClient();
//   });

//   group('GET /post/{id}/comments', () {
//     test('GET post/id/comments success', () async {
//       when(
//         mockApiClient.getRequest(argThat(contains('posts')), any),
//       ).thenAnswer((_) async => commentsResponse);

//       final comments = parseListResponse<CommentModel>(
//         commentsResponse,
//         CommentModel.fromJson,
//       );

//       final controller = ApiController(client: mockApiClient);
//       final data = await controller.getComments(postId: 1);

//       expect(data, equals(comments));
//     });
//   });

//   group('GET /posts', () {
//     setUp(() {
//       when(
//         mockApiClient.getRequest(argThat(contains('posts/1')), any),
//       ).thenAnswer((_) async => singlePostResponse);

//       when(
//         mockApiClient.getRequest(argThat(isNot(contains('posts/1'))), any),
//       ).thenAnswer((_) async => allPostsResponse);
//     });

//     test('GET post/id success', () async {
//       final singlePost = parseSingleResponse(
//         singlePostResponse,
//         PostModel.fromJson,
//       );

//       final controller = ApiController(client: mockApiClient);
//       final result = await controller.getSinglePost(postId: 1);

//       expect(result, equals(singlePost));
//     });

//     test('GET posts success', () async {
//       final allPosts = parseListResponse(allPostsResponse, PostModel.fromJson);

//       final controller = ApiController(client: mockApiClient);
//       final result = await controller.getAllPosts();

//       expect(result, equals(allPosts));
//     });
//   });
// }
