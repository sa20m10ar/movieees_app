import 'package:flutter/material.dart';
import '../model/movie.dart';
import '../screens/movie_details_screen.dart';

class PopularMoviesWidget extends StatelessWidget {
  final int index;
  PopularMoviesWidget(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 160,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            MovieDetailsScreen.id,
            arguments: {
              'id': topRatedMovieList[index].id,
              'title': topRatedMovieList[index].title,
              'imageUrl': topRatedMovieList[index].imageUrl,
              'description': topRatedMovieList[index].description,
              'rating': topRatedMovieList[index].rating,
              'year': topRatedMovieList[index].year,
              'duration': topRatedMovieList[index].duration,
            },
          );
        },
        child: Column(
          children: <Widget>[
            Card(
              elevation: 10,
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(topRatedMovieList[index].imageUrl),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              topRatedMovieList[index].title,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
