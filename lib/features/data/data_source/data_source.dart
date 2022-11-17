import '../models/movie_list_model.dart';

abstract class XnoMoviesDataSource {
  Future<MovieListModel> getLatestMovies();

  Future<MovieListModel> getSimilarMovies();

  Future<MovieModel> getMoviesDetails({required String id});
}
