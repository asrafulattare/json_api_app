import 'package:flutter/material.dart';
import 'package:json_api_app/screen/comment_screen.dart';
import 'package:json_api_app/screen/photos.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('HomeScreen'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CommentScreen(),
                    ),
                  );
                },
                child: const Text('Comment List'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PhotosScreen(),
                  ),
                );
              },
              child: const Text('Photo Grid'),
            ),
          ],
        ),
      ),
    );
  }
}
