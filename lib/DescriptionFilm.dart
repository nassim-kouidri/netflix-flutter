import 'package:flutter/material.dart';
import 'models.dart';
import 'ApiService.dart'; 

class DescriptionFilm extends StatefulWidget {
  final int movieId; 

  DescriptionFilm({required this.movieId});

  @override
  _DescriptionFilmState createState() => _DescriptionFilmState();
}

class _DescriptionFilmState extends State<DescriptionFilm> {
  late Future<Movie> futureMovie;

  @override
  void initState() {
    super.initState();
    futureMovie = ApiService().fetchMovieDetails(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Description du Film'),
        backgroundColor: Colors.black,
      ),
      body: Stack( //emplie les un contre les autres
        children: <Widget>[
          Container(
            color: Colors.black,
          ),
          FutureBuilder<Movie>(
            future: futureMovie,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Erreur de chargement des détails du film'));
              } else if (snapshot.hasData) {
                Movie movie = snapshot.data!;
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Image.network(
                            movie.poster,
                            width: 200,
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          movie.title,
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Date de sortie: ${movie.releaseDate}', 
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Langue originale: ${movie.originalLanguage}', 
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Titre original: ${movie.originalTitle}', 
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Vote moyen: ${movie.voteAverage}', 
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        Text(
                          'Nombre de votes: ${movie.voteCount}', 
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        // Description
                        Text(
                          'Description: ${movie.overview}', 
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Center(child: Text('Aucun détail de film trouvé'));
              }
            },
          ),
        ],
      ),
    );
  }
}
