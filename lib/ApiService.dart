import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models.dart';

class ApiService {
  final String apiKey = 'MY_API_KEY';
  final String baseUrl = 'https://api.themoviedb.org/3';

  Future<List<Movie>> fetchMovies() async {
    final response = await http.get(Uri.parse('$baseUrl/movie/popular?api_key=$apiKey'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      List<Movie> movies = [];
      for (var movie in data['results']) {
        movies.add(Movie.fromJson(movie));
      }
      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<Series>> fetchSeries() async {
    final response = await http.get(Uri.parse('$baseUrl/tv/popular?api_key=$apiKey'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      List<Series> series = [];
      for (var tvSeries in data['results']) {
        series.add(Series.fromJson(tvSeries));
      }
      return series;
    } else {
      throw Exception('Failed txo load series');
    }
  }

  Future<List<Actor>> fetchActors() async {
    final response = await http.get(Uri.parse('$baseUrl/person/popular?api_key=$apiKey'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        List<Actor> actors = [];
        for (var actor in data['results']) {
          actors.add(Actor.fromJson(actor));
        }
        return actors;
      } else {
        throw Exception('Failed to load actors');
      }
  }

  Future<Movie> fetchMovieDetails(int movieId) async {
    final response = await http.get(Uri.parse('$baseUrl/movie/$movieId?api_key=$apiKey'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Movie.fromJson(data);
    } else {
      throw Exception('Failed to load movie details');
    }
  }

  Future<Series> fetchSerieDetails(int serieId) async {
    final response = await http.get(Uri.parse('$baseUrl/tv/$serieId?api_key=$apiKey'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Series.fromJson(data);
    } else {
      throw Exception('Failed to load series details');
    }
  }


Future<ActorDetails> fetchActorDetails(int actorId) async {
  final response = await http.get(Uri.parse('$baseUrl/person/$actorId?api_key=$apiKey'));
  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    return ActorDetails.fromJson(data);
  } else {
    throw Exception('Failed to load actor details');
  }
}


}
