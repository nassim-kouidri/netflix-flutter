import 'package:flutter/material.dart';
import 'models.dart';
import 'ApiService.dart';
import 'DescriptionSerie.dart'; 

class SeriesPage extends StatelessWidget {
  final List<Series> series;

  SeriesPage({required this.series});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Séries'),
        backgroundColor: Colors.black, 
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, 
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.5, // ratio largeur-longueur
        ),
        itemCount: series.length,
        itemBuilder: (context, index) {
          Series tvSeries = series[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DescriptionSerie(serieId: tvSeries.id), 
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  children: <Widget>[
                    Image.network(tvSeries.poster, width: 100, height: 150, fit: BoxFit.cover),
                    SizedBox(height: 8),
                    Text(
                      tvSeries.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Text('${tvSeries.year}', textAlign: TextAlign.center),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
