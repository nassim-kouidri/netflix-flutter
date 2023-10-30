import 'package:flutter/material.dart';
import 'models.dart';
import 'ApiService.dart'; 

class DescriptionSerie extends StatefulWidget {
  final int serieId;

  DescriptionSerie({required this.serieId});

  @override
  _DescriptionSerieState createState() => _DescriptionSerieState();
}

class _DescriptionSerieState extends State<DescriptionSerie> {
  late Future<Series> futureSerie;

  @override
  void initState() {
    super.initState();
    futureSerie = ApiService().fetchSerieDetails(widget.serieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Description de la Série'),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.black,
          ),
          FutureBuilder<Series>(
            future: futureSerie,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Erreur de chargement des détails de la série'));
              } else if (snapshot.hasData) {
                Series serie = snapshot.data!;
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Image.network(
                            serie.poster,
                            width: 200,
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          serie.title,
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Date de sortie: ${serie.firstAirDate}',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Langue originale: ${serie.originalLanguage}', 
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Titre original: ${serie.originalTitle}', 
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Vote moyen: ${serie.voteAverage}', 
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        Text(
                          'Nombre de votes: ${serie.voteCount}', 
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Description: ${serie.overview}', 
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Center(child: Text('Aucun détail de série trouvé'));
              }
            },
          ),
        ],
      ),
    );
  }
}
