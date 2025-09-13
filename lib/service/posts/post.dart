import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';

/// A User's Post
@freezed
abstract class Post with _$Post {
  factory Post({
    required int id,
    required int userId,
    required String title,
    required String body,

    /// Offline posts are stored in the local repository.
    bool? offline,
  }) = _Post;
}
