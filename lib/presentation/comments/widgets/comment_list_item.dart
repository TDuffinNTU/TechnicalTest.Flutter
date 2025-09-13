import 'package:flutter/material.dart';
import 'package:flutter_tech_task/presentation/common/random_color.dart';
import 'package:flutter_tech_task/service/comments/comment.dart';

class CommentListItem extends StatelessWidget {
  const CommentListItem({super.key, required this.comment});
  final Comment comment;

  @override
  Widget build(BuildContext context) {
    Color commentColor = getRandomColor(comment.id);
    return InkWell(
      splashColor: commentColor.withAlpha(50),
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Divider(height: 1),
          Container(
            color: commentColor.withAlpha(50),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 5.0,
              ),

              child: Row(
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: getRandomColor(comment.id),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'u/${comment.name.split(' ').sublist(0, 3).join('_')}',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(comment.email),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(comment.body),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
