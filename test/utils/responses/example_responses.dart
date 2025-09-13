import 'dart:convert';
import 'dart:io';

const getCommentsSuccessJson = 'comments_success';
const getSinglePostSuccessJson = 'single_post_success';
const getAllPostsSuccessJson = 'all_posts_success';

final dir = '${Directory.current.path}/test/utils/responses/';

List<Map<String, dynamic>> getExampleResponse(String filename) =>
    List.castFrom<dynamic, Map<String, dynamic>>(
      jsonDecode(File('$dir/$filename.json').readAsStringSync()),
    );
