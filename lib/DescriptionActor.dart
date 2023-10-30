import 'package:flutter/material.dart';
import 'models.dart';
import 'ApiService.dart';

class DescriptionActor extends StatefulWidget {
  final int actorId;

  DescriptionActor({required this.actorId});

  @override
  _DescriptionActorState createState() => _DescriptionActorState();
}

class _DescriptionActorState extends State<DescriptionActor> {
  late Future<ActorDetails> futureActorDetails;

  @override
  void initState() {
    super.initState();
    futureActorDetails = ApiService().fetchActorDetails(widget.actorId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Description de l\'acteur'),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.black,
          ),
          FutureBuilder<ActorDetails>(
            future: futureActorDetails,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Erreur de chargement des détails de l\'acteur'));
              } else if (snapshot.hasData) {
                ActorDetails actor = snapshot.data!;
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Image.network(
                            actor.profilePicture,
                            width: 200,
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          actor.name,
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Date de naissance: ${actor.birthday}',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Lieu de naissance: ${actor.placeOfBirth}',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Biographie: ${actor.biography}',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Center(child: Text('Aucun détail d\'acteur trouvé'));
              }
            },
          ),
        ],
      ),
    );
  }
}
