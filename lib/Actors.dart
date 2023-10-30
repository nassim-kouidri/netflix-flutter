import 'package:flutter/material.dart';
import 'models.dart';
import 'ApiService.dart';
import 'DescriptionActor.dart';

class ActorsPage extends StatelessWidget {
  final List<Actor> actors;

  ActorsPage({required this.actors});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acteurs'),
        backgroundColor: Colors.black,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.6,
        ),
        itemCount: actors.length,
        itemBuilder: (context, index) {
          Actor actor = actors[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DescriptionActor(actorId: actor.id),
                ),
              );
            },
            child: Card(
              child: Column(
                children: <Widget>[
                  Image.network(actor.profilePicture, width: 100, height: 150, fit: BoxFit.cover),
                  SizedBox(height: 8),
                  Text(
                    actor.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    actor.popularity.toString(),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
