import 'package:flutter/material.dart';
import '../model/movie.dart';
import '../widget/popular_movies_widget.dart';

class PopularMovies extends StatelessWidget {
  static const String id = 'PopularMovies';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff4f4f4),
        appBar: AppBar(
          title: Text(
            'Popular Movies',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color(0xfff4f4f4),
          elevation: 0,
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 700,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              scrollDirection: Axis.vertical,
              itemCount: movieList.length,
              itemBuilder: (ctx, i) => PopularMoviesWidget(i),
            ),
          ),
        ));
  }
}
