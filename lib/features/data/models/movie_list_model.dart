import '../../domain/entities/movie_list.dart';

class MovieListModel extends MovieList {
  MovieListModel({
    int page = 1,
    List<MovieModel> results = const [],
    int totalPages = 1,
    int totalResults = 0,
  }) : super(
          page: page,
          results: results,
          totalPages: totalPages,
          totalResults: totalResults,
        );

  factory MovieListModel.fromJson(Map<String, dynamic> json) {
    final results = <MovieModel>[];
    if (json['results'] != null) {
      json['results'].forEach((v) {
        results.add(MovieModel.fromJson(v));
      });
    }
    return MovieListModel(
      page: json['page'] ?? 0,
      results: results,
      totalPages: json['total_pages'] ?? 1,
      totalResults: json['total_results'] ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    if (results.isNotEmpty) {
      data['results'] = results.map((v) => (v as MovieModel).toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}

class MovieModel extends Movie {
  MovieModel({
    final bool adult = false,
    final String backdropPath = '',
    final List<int> genreIds = const [],
    final List<Genres> genres = const [],
    final int id = 0,
    final String originalLanguage = '',
    final String originalTitle = '',
    final String overview = '',
    final double popularity = 0.0,
    final String posterPath = '',
    final String releaseDate = '',
    final String title = '',
    final bool video = false,
    final double voteAverage = 0,
    final int voteCount = 0,
    final int budget = 0,
    final int revenue = 0,
    final int runtime = 0,
  }) : super(
          posterPath: posterPath,
          adult: adult,
          backdropPath: backdropPath,
          genreIds: genreIds,
          genres: genres,
          id: id,
          originalLanguage: originalLanguage,
          originalTitle: originalTitle,
          overview: overview,
          popularity: popularity,
          releaseDate: releaseDate,
          title: title,
          video: video,
          voteAverage: voteAverage,
          voteCount: voteCount,
          revenue: revenue,
          runtime: runtime,
          budget: budget,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    final posterPath = json['poster_path']?.toString() ?? '';
    final poster = 'https://image.tmdb.org/t/p/w400$posterPath';
    final genres = <Genres>[];
    if (json['genres'] != null) {
      json['genres'].forEach((v) {
        genres.add(GenresModel.fromJson(v));
      });
    }
    return MovieModel(
      adult: json['adult'] ?? false,
      backdropPath: json['backdrop_path'] ?? '',
      genreIds:
          json['genre_ids'] != null ? json['genre_ids'].cast<int>() ?? [] : [],
      genres: genres,
      id: json['id'] ?? 0,
      originalLanguage: json['original_language'] ?? '',
      originalTitle: json['original_title'] ?? '',
      overview: json['overview'] ?? '',
      popularity: json['popularity'] ?? 0.0,
      posterPath: posterPath.isNotEmpty ? poster : '',
      releaseDate: json['release_date'] ?? '',
      title: json['title'] ?? '',
      video: json['video'] ?? false,
      voteAverage:
          double.tryParse(json['vote_average']?.toString() ?? '0') ?? 0,
      voteCount: json['vote_count'] ?? 0,
      revenue: json['revenue'] ?? 0,
      runtime: json['runtime'] ?? 0,
      budget: json['budget'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['genre_ids'] = genreIds;
    data['id'] = id;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}

class GenresModel extends Genres {
  GenresModel({
    int id = 0,
    String name = '',
  }) : super(id: id, name: name);

  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
