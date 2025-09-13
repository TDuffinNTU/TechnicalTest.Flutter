import 'dart:convert';
import 'dart:io';

const getCommentsSuccessJson = 'comments_success';
const getSinglePostSuccessJson = 'single_post_success';
const getAllPostsSuccessJson = 'all_posts_success';

final _dir = '${Directory.current.path}/test/utils/responses';

Map<String, dynamic> decodeFile(String filename) {
  return {'data': jsonDecode(File('$_dir/$filename.json').readAsStringSync())};
}
