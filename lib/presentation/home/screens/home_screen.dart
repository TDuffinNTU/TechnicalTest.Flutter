import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<dynamic> posts = <dynamic>[];

  @override
  void initState() {
    super.initState();
    http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/'))
        .then((http.Response response) {
      setState(() {
        posts = json.decode(response.body);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of posts'),
      ),
      body: ListView(
        children: posts
            .map(
              (post) => InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    'details/',
                    arguments: <String, dynamic>{'id': post['id']},
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        post['title'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(post['body']),
                      Container(height: 10),
                      const Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
