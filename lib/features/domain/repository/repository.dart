import '../entities/movie_list.dart';

abstract class XnoMoviesRepository {
  Future<MovieList> getLatestMovies();

  Future<MovieList> getSimilarMovies();

  Future<Movie> getMoviesDetails({required String id});
}
