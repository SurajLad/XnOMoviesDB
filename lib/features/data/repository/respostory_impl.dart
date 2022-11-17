import 'package:xno_movies/features/domain/entities/movie_list.dart';

import '../../domain/repository/repository.dart';
import '../data_source/data_source.dart';
import '../models/movie_list_model.dart';

class XnoMoviesRepositoryImpl implements XnoMoviesRepository {
  final XnoMoviesDataSource _dataSource;

  const XnoMoviesRepositoryImpl({
    required XnoMoviesDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<MovieList> getLatestMovies() async {
    return _dataSource.getLatestMovies();
  }

  @override
  Future<MovieList> getSimilarMovies() async {
    return _dataSource.getSimilarMovies();
  }

  @override
  Future<MovieModel> getMoviesDetails({required String id}) {
    return _dataSource.getMoviesDetails(id: id);
  }
}
