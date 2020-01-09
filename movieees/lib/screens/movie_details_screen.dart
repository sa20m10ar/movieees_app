import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetailsScreen extends StatefulWidget {
  
  static const String id = 'MovieDetailsScreen';

  @override
  _MovieDetailsScreenState createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final String _launchUrl = "https://www.youtube.com";

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url,
          forceSafariVC: true,
          forceWebView: false,
          headers: <String, String>{'header_key': 'header_value'},
          universalLinksOnly: true);
    } else {
      throw 'could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final id = routeArgs['id'];
    final rating = routeArgs['rating'];

    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      appBar: AppBar(
        title: Text(
          'Movie Details',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xfff4f4f4),
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Column(
          children: <Widget>[
            Center(
              child: Card(
                elevation: 5,
                child: Hero(
                  tag: id,
                  child: Container(
                    height: 450,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          routeArgs['imageUrl'],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              routeArgs['title'],
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.timer,
                          size: 45,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          routeArgs['duration'],
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.calendar_today,
                          size: 45,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          routeArgs['year'],
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.star_border,
                          size: 45,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '$rating/10',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              routeArgs['description'],
              style: TextStyle(
                fontSize: 18,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              onPressed: () {
                _launchInBrowser(_launchUrl);
              },
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(
                    Icons.play_circle_outline,
                  ),
                  Text(
                    'Watch Trailer',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: RaisedButton(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              onPressed: () {},
              color: Colors.yellowAccent,
              textColor: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.favorite_border,
                  ),
                  Container(
                    height: 5,
                    width: 5,
                  ),
                  Text(
                    'Favourite',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
