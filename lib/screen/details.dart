import 'package:flutter/material.dart';

import 'package:json_api_app/model/comments_model.dart';

class CommentsScreen extends StatelessWidget {
  final Comments comments;

  const CommentsScreen({
    Key? key,
    required this.comments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Text(comments.postId.toString()),
          Text(comments.name),
          Text(comments.email),
          Text(comments.body),
        ],
      )),
    );
  }
}
