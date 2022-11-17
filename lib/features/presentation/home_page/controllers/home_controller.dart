import 'package:get/get.dart';
import 'package:xno_movies/features/domain/usecases/movies_usecase.dart';

import '../../../domain/entities/movie_list.dart';

class HomeController {
  final XnOMoviesUsecase _usecase;

  final moviesList = MovieList().obs;
  final movies = <Movie>[].obs;

  HomeController({
    required XnOMoviesUsecase usecase,
  }) : _usecase = usecase {
    getLatestMovies();
  }

  void getLatestMovies() async {
    moviesList.value = await _usecase.getLatestMovies();
    movies.addAll(moviesList.value.results);
    print(moviesList.value.totalPages);
  }
}
