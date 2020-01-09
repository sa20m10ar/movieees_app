import 'package:flutter/material.dart';
import './screens/Favourite_movies.dart';
import './screens/popular_movies.dart';
import './screens/upcoming_movies.dart';
import './screens/welcome_screen.dart';
import './screens/movie_details_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
      initialRoute: WelcomeScreen.id,
      routes: {
        MovieDetailsScreen.id: (context) => MovieDetailsScreen(),
        UpcomingMovies.id: (context) => UpcomingMovies(),
        PopularMovies.id: (context) => PopularMovies(),
        FavouriteMovies.id: (context) => FavouriteMovies(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
      },
    );
  }
}
