import 'package:get/get.dart';
import 'package:xno_movies/features/domain/entities/movie_list.dart';
import 'package:xno_movies/features/presentation/home_page/controllers/states.dart';

import '../../domain/usecases/movies_usecase.dart';

class MovieDetailController {
  final XnOMoviesUsecase _usecase;
  final String _id;
  final movieDetail = Movie().obs;
  final pageState = PageState.loading.obs;

  MovieDetailController({
    required XnOMoviesUsecase usecase,
    required String id,
  })  : _usecase = usecase,
        _id = id {
    getMovieDetails();
    getSimilarMovies();
  }

  Future<void> getMovieDetails() async {
    movieDetail.value = await _usecase.getMoviesDetails(id: _id);
    pageState.value = PageState.data;
  }

  Future<void> getSimilarMovies() async {
    // Soon
  }
}
