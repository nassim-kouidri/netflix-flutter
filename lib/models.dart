class Movie {
  final int id;
  final String title;
  final String poster;
  final int year;
  final String releaseDate;
  final String overview;
  final String originalLanguage;
  final String originalTitle;
  final double voteAverage;
  final int voteCount;

  Movie({
    required this.id,
    required this.title,
    required this.poster,
    required this.year,
    required this.releaseDate,
    required this.overview,
    required this.originalLanguage,
    required this.originalTitle,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      poster: 'https://image.tmdb.org/t/p/w500${json['poster_path']}',
      year: json['release_date'] != null ? int.parse(json['release_date'].substring(0, 4)) : 0,
      releaseDate: json['release_date'],
      overview: json['overview'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count'],
    );
  }
}

class Series {
  final int id;
  final String title;
  final String poster;
  final int year;
  final String firstAirDate;
  final String overview;
  final String originalLanguage;
  final String originalTitle;
  final double voteAverage;
  final int voteCount;

  Series({
    required this.id,
    required this.title,
    required this.poster,
    required this.year,
    required this.firstAirDate,
    required this.overview,
    required this.originalLanguage,
    required this.originalTitle,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Series.fromJson(Map<String, dynamic> json) {
    return Series(
      id: json['id'],
      title: json['name'],
      poster: 'https://image.tmdb.org/t/p/w500${json['poster_path']}',
      year: json['first_air_date'] != null ? int.parse(json['first_air_date'].substring(0, 4)) : 0,
      firstAirDate: json['first_air_date'],
      overview: json['overview'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_name'],
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count'],
    );
  }
}

class Actor {
  final int id;
  final String name;
  final String profilePicture;
  final double popularity; 

  Actor({
    required this.id,
    required this.name,
    required this.profilePicture,
    required this.popularity, 
  }); 

  factory Actor.fromJson(Map<String, dynamic> json) {
    return Actor(
      id: json['id'],
      name: json['name'],
      profilePicture: 'https://image.tmdb.org/t/p/w500${json['profile_path']}',
      popularity: json['popularity'], 
    );
  }
}

class ActorDetails {
  final int id;
  final String name;
  final String profilePicture;
  final String biography;
  final String placeOfBirth;
  final String birthday;
  
  ActorDetails({
    required this.id,
    required this.name,
    required this.profilePicture,
    required this.biography,
    required this.placeOfBirth,
    required this.birthday,
  });

  factory ActorDetails.fromJson(Map<String, dynamic> json) {
    return ActorDetails(
      id: json['id'],
      name: json['name'],
      profilePicture: 'https://image.tmdb.org/t/p/w500${json['profile_path']}',
      biography: json['biography'],
      placeOfBirth: json['place_of_birth'],
      birthday: json['birthday'],
    );
  }
}







