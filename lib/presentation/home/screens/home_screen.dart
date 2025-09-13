import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tech_task/service/posts/posts_service.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('List of posts')),
      body: Center(
        child: ref
            .watch(postsServiceProvider)
            .when(
              error: (error, _) => ErrorWidget(error),
              loading: () => CircularProgressIndicator(),
              data: (posts) => ListView(
                children: posts
                    .map(
                      (post) => InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            'details/',
                            arguments: <String, int>{'id': post.id},
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                post.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(post.body),
                              Container(height: 10),
                              const Divider(thickness: 1, color: Colors.grey),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
      ),
    );
  }
}
