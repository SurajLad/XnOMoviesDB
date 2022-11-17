import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:xno_movies/features/data/data_source/data_source.dart';
import 'package:xno_movies/features/data/data_source/remote_data_source.dart';
import 'package:xno_movies/features/data/repository/respostory_impl.dart';
import 'package:xno_movies/features/domain/repository/repository.dart';
import 'package:xno_movies/features/domain/usecases/movies_usecase.dart';

import '../../features/presentation/home_page/controllers/home_controller.dart';

class Injection {
  static void disposeModules() {
    GetIt.I.unregister<HttpClient>();

    GetIt.I.unregister<XnoMoviesDataSource>();
    GetIt.I.unregister<XnoMoviesRepository>();
    GetIt.I.unregister<XnOMoviesUsecase>();
  }

  static void initModules() {
    // LOcal DB

    // Network Client
    GetIt.I.registerSingleton<Client>(Client());

    // data source
    GetIt.I.registerSingleton<XnoMoviesDataSource>(
      XnoMoviesRemoteSource(httpClient: GetIt.I.get<Client>()),
    );

    // Repository
    GetIt.I.registerSingleton<XnoMoviesRepository>(
      XnoMoviesRepositoryImpl(dataSource: GetIt.I.get<XnoMoviesDataSource>()),
    );
    // Usecase
    GetIt.I.registerSingleton<XnOMoviesUsecase>(
      XnoMoviesUsecaseImpl(repository: GetIt.I.get<XnoMoviesRepository>()),
    );

    //
    GetIt.I.registerSingleton<HomeController>(
      HomeController(usecase: GetIt.I.get<XnOMoviesUsecase>()),
    );
  }
}
