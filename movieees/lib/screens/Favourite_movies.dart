import 'package:flutter/material.dart';
import '../model/movie.dart';
import '../widget/favourite_movies_widget.dart';

class FavouriteMovies extends StatelessWidget {
  static const String id = 'FavouriteMovies';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff4f4f4),
        appBar: AppBar(
          title: Text(
            'Favourite Movies',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color(0xfff4f4f4),
          elevation: 0,
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 500,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: movieList.length,
              itemBuilder: (ctx, i) => FavouriteMoviesWidget(i),
            ),
          ),
        ));
  }
}
