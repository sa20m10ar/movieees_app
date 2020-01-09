import 'package:flutter/material.dart';
import 'package:movieees/model/movie.dart';
import '../widget/upcoming_movies_widget.dart';

class UpcomingMovies extends StatelessWidget {
  static const String id = 'UpcomingMovies';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff4f4f4),
        appBar: AppBar(
          title: Text(
            'Upcoming Movies',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color(0xfff4f4f4),
          elevation: 0,
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
              height: 700,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: movieList.length,
                itemBuilder: (ctx, i) => UpcomingMoviesWidget(i),
              ),
            ),
          ],
        )));
  }
}
