import 'package:flutter/material.dart';
import '../screens/popular_movies.dart';
import '../screens/upcoming_movies.dart';
import '../model/movie.dart';
import '../widget/popular_movies_widget.dart';
import '../widget/favourite_movies_widget.dart';
import '../widget/upcoming_movies_widget.dart';
import 'Favourite_movies.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Upcoming Movies',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FlatButton(
                    child: Text('View All'),
                    onPressed: () {
                      Navigator.pushNamed(context, UpcomingMovies.id);
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: 280,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movieList.length,
                itemBuilder: (ctx, i) => UpcomingMoviesWidget(i),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Favourite Movies',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FlatButton(
                    child: Text('View All'),
                    onPressed: () {
                      Navigator.pushNamed(context, FavouriteMovies.id);
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: 500,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: bestMovieList.length,
                itemBuilder: (ctx, i) => FavouriteMoviesWidget(i),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Popular Movies',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FlatButton(
                    child: Text('View All'),
                    onPressed: () {
                      Navigator.pushNamed(context, PopularMovies.id);
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: 280,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topRatedMovieList.length,
                itemBuilder: (ctx, i) => PopularMoviesWidget(i),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: TitledBottomNavigationBar(
      //     //currentIndex:2,
      //     onTap: (index) {
      //       Navigator.pushNamed(context, UpcomingMovies.id);
      //       Navigator.pushNamed(context, PopularMovies.id);
      //     },
      //     items: [
      //       TitledNavigationBarItem(title: 'Upcoming', icon: Icons.fiber_new),
      //       TitledNavigationBarItem(title: 'Popular', icon: Icons.poll),
      //       TitledNavigationBarItem(
      //           title: 'Favourites', icon: Icons.favorite_border),
      //     ]),
    );
  }
}
