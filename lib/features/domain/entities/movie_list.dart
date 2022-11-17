class MovieList {
  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  MovieList({
    this.page = 1,
    this.results = const [],
    this.totalPages = 1,
    this.totalResults = 0,
  });
}

class Movie {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final List<Genres> genres;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;
  final int revenue;
  final int runtime;
  final int budget;

  Movie({
    this.adult = false,
    this.backdropPath = '',
    this.genreIds = const [],
    this.genres = const [],
    this.id = -1,
    this.originalLanguage = '',
    this.originalTitle = '',
    this.overview = '',
    this.popularity = 0.0,
    this.posterPath = '',
    this.releaseDate = '',
    this.title = '',
    this.video = false,
    this.voteAverage = 0,
    this.voteCount = 0,
    this.revenue = 0,
    this.runtime = 0,
    this.budget = 0,
  });
}

class Genres {
  int id;
  String name;

  Genres({
    this.id = 0,
    this.name = '',
  });
}
