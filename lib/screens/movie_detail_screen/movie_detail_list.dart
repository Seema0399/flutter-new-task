import 'package:flutter/material.dart';
import 'package:flutter_task_new/screens/movie_detail_screen/movie_detail.dart';
import 'package:flutter_task_new/screens/movie_detail_screen/movie.dart';
import 'package:flutter_task_new/utils/string_resources.dart';

class ListDetail extends StatelessWidget {
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
      ),
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (context, index) {
            Movie movie = movieList[index];
            return Card(
              child: ListTile(
                title: Text(movie.title),
                subtitle: Text(movie.year.toString()),
                trailing: Icon(Icons.arrow_forward),
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MovieDetail(movie))),
                },
              ),
            );
          }),
    );
  }
}
