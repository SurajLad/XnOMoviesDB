import '../entities/movie_list.dart';
import '../repository/repository.dart';

abstract class XnOMoviesUsecase {
  Future<MovieList> getLatestMovies();

  Future<MovieList> getSimilarMovies();

  Future<Movie> getMoviesDetails({required String id});
}

class XnoMoviesUsecaseImpl implements XnOMoviesUsecase {
  final XnoMoviesRepository _repository;

  const XnoMoviesUsecaseImpl({
    required XnoMoviesRepository repository,
  }) : _repository = repository;

  @override
  Future<MovieList> getLatestMovies() async {
    return _repository.getLatestMovies();
  }

  @override
  Future<MovieList> getSimilarMovies() async {
    return _repository.getSimilarMovies();
  }

  @override
  Future<Movie> getMoviesDetails({required String id}) async {
    return _repository.getMoviesDetails(id: id);
  }
}
