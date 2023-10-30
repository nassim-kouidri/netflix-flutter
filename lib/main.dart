import 'package:flutter/material.dart';
//import 'package:flutter/src/material/colors.dart';
import 'models.dart'; 
import 'ApiService.dart'; 
import 'Films.dart'; 
import 'Series.dart'; 
import 'Actors.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nassim Netflix',
      theme: ThemeData(
      primaryColor: Colors.green, 
    ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/movies': (context) => MoviesPage(movies: ModalRoute.of(context)!.settings.arguments as List<Movie>),
        '/series': (context) => SeriesPage(series: ModalRoute.of(context)!.settings.arguments as List<Series>),
        '/actors': (context) => ActorsPage(actors: ModalRoute.of(context)!.settings.arguments as List<Actor>),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Netflix Nassim'),
      backgroundColor: Colors.black, 
      centerTitle: true,

    ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                apiService.fetchMovies().then((movies) {
                  Navigator.pushNamed(context, '/movies', arguments: movies);
                });
              },
               style: ElevatedButton.styleFrom(
                primary: Colors.black, 
              ),
              child: Text('Voir les Films'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                apiService.fetchSeries().then((series) {
                  Navigator.pushNamed(context, '/series', arguments: series);
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
              child: Text('Voir les Séries'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                apiService.fetchActors().then((actors) {
                  Navigator.pushNamed(context, '/actors', arguments: actors);
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
              child: Text('Voir les Acteurs'),
            ),
          ],
        ),
      ),
    );
  }
}
