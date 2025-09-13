import 'package:flutter_tech_task/repository/comments/comment.dart';
import 'package:flutter_tech_task/repository/common/api_controller.dart';
import 'package:flutter_tech_task/repository/common/api_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../utils/responses/example_responses.dart';

import 'api_client_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ApiClient>()])
void main() {
  MockApiClient mockApiClient;
  setUp(() {
    mockApiClient = MockApiClient();
    when(
      mockApiClient.getRequest(any, any),
    ).thenAnswer((_) async => getExampleResponse(getCommentsSuccessJson));
  });
  test('GET post/id/comments success', () async {
    final exampleResponse = getExampleResponse(getCommentsSuccessJson);

    final comments = List.from(
      exampleResponse,
    ).map((e) => Comment.fromJson(e)).toList();

    final controller = ApiController();
    final data = await controller.getComments(null, postId: '1');

    expect(data, equals(comments));
  });

  test('GET post/id success', () async {});
}
