import 'package:flutter/material.dart';
import 'package:json_api_app/helper/comments_helper.dart';
import 'package:json_api_app/model/comments_model.dart';
import 'package:json_api_app/screen/details.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  List<Comments>? comments;

  bool isLoaded = false;
  getData() async {
    comments = await CommentsHelper().getComments();
    setState(() {
      isLoaded = true;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Comments Screen'),
      ),
      body: SafeArea(
        child: Visibility(
          visible: isLoaded,
          replacement: const Center(child: CircularProgressIndicator()),
          child: ListView.builder(
              itemCount: comments?.length ?? 0,
              itemBuilder: (_, index) {
                final data = comments![index];
                return Card(
                  elevation: 5,
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CommentsScreen(comments: data),
                          ));
                    },
                    title: Text(comments![index].email),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
