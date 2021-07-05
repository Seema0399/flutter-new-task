import 'package:flutter/material.dart';
import 'package:flutter_task_new/screens/gallery_camera_screen/gallery_camera.dart';
import 'package:flutter_task_new/screens/movie_detail_screen/movie.dart';
import 'package:flutter_task_new/utils/font.dart';
import 'package:flutter_task_new/utils/string_resources.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringResource.movies,
          style: TextStyle(
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.arrow_forward_ios_outlined),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GalleryCamera()));
              }),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                movie.year.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: FontSize.seventeen),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                movie.description,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: FontSize.twentytwo),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
