import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:json_api_app/model/photos_model.dart';

import '../helper/photos_helper.dart';

class PhotosScreen extends StatefulWidget {
  const PhotosScreen({Key? key}) : super(key: key);

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  List<Photos>? photos;
  bool isLoaded = false;

  loadData() async {
    photos = await PhotosHelper().getPhotos();
    setState(() {
      isLoaded = true;
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Photos Screen'),
      ),
      body: SafeArea(
        child: Visibility(
          visible: isLoaded,
          replacement: const Center(child: CircularProgressIndicator()),
          child: MasonryGridView.count(
            itemCount: photos?.length,
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            itemBuilder: (context, index) {
              //final i = (index % 5 + 1) * 100;
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PhotoDetails(photos: photos![index]),
                      ));
                },
                child: Hero(
                  tag: photos![index].id,
                  child: Card(
                    child: Image.network(photos![index].url),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class PhotoDetails extends StatelessWidget {
  final Photos photos;

  const PhotoDetails({super.key, required this.photos});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: photos.id,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text('Albam Id ${photos.id.toString()}'),
          ),
          body: Column(
            children: [
              Image.network(photos.url),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(photos.title),
              ),
              Image.network(photos.thumbnailUrl),
            ],
          ),
        ),
      ),
    );
  }
}
