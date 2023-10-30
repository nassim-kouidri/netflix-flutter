import 'package:flutter/material.dart';
import 'models.dart';
import 'DescriptionFilm.dart';

class MoviesPage extends StatelessWidget {
  final List<Movie> movies;

  MoviesPage({required this.movies});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Films'),
        backgroundColor: Colors.black, 
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.7,
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          Movie movie = movies[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DescriptionFilm(movieId: movie.id),
                ),
              );
            },
            child: Card(
              child: Column(
                children: <Widget>[
                  Expanded(child: Image.network(movie.poster, width: 100, height: 150, fit: BoxFit.cover),),
                  
                  SizedBox(height: 8),
                  Text(
                    movie.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text('${movie.year}', textAlign: TextAlign.center),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
