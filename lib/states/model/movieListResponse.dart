class MovieListResponse {
  MovieListResponse({
    required this.genres,
    required this.movies,
  });

  final List<String> genres;
  final List<Movie> movies;

  factory MovieListResponse.fromJson(Map<dynamic, dynamic> json) {
    return MovieListResponse(
      genres: json["genres"] == null
          ? []
          : List<String>.from(json["genres"]!.map((x) => x)),
      movies: json["movies"] == null
          ? []
          : List<Movie>.from(json["movies"]!.map((x) => Movie.fromJson(x))),
    );
  }
}

class Movie {
  Movie({
    required this.id,
    required this.title,
    required this.year,
    required this.runtime,
    required this.genres,
    required this.director,
    required this.actors,
    required this.plot,
    required this.posterUrl,
  });

  final int? id;
  final String? title;
  final String? year;
  final String? runtime;
  final List<String> genres;
  final String? director;
  final String? actors;
  final String? plot;
  final String? posterUrl;

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json["id"],
      title: json["title"],
      year: json["year"],
      runtime: json["runtime"],
      genres: json["genres"] == null
          ? []
          : List<String>.from(json["genres"]!.map((x) => x)),
      director: json["director"],
      actors: json["actors"],
      plot: json["plot"],
      posterUrl: json["posterUrl"],
    );
  }
}
