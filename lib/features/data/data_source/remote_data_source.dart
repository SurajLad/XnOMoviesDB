import 'dart:convert';

import 'package:http/http.dart';

import '../../../core/exception_handler/exceptions.dart';
import '../../../core/urls.dart';
import '../models/movie_list_model.dart';
import 'data_source.dart';

class XnoMoviesRemoteSource implements XnoMoviesDataSource {
  final Client _api;

  const XnoMoviesRemoteSource({
    required Client httpClient,
  }) : _api = httpClient;

  @override
  Future<MovieListModel> getLatestMovies() async {
    late MovieListModel movieListModel;
    try {
      final uri = Uri(
        scheme: 'https',
        host: Urls.baseUrl,
        path: Urls.popularMovies,
        queryParameters: {
          'api_key': 'bb6677196e727a4bcaede556f2300d0b',
          'language': 'en-US',
          'page': '1',
          'region': 'IN',
        },
      );

      final response = await _api.get(uri);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        movieListModel = MovieListModel.fromJson(data);
        // print(response.body);
      } else if (response.statusCode == 400) {
        throw BadRequestException(
          message: 'The request was unacceptable,',
        );
      } else if (response.statusCode == 401) {
        throw UnAuthorizedtException(
            message: 'You are not authorized to get data');
      } else if (response.statusCode == 404) {
        throw NotFoundException(
            message: 'The requested resource doesn\'t exist.');
      } else if (response.statusCode == 429) {
        throw RateLimitExceededException(
            message: 'API request limit exceeded.');
      } else {
        throw InternalServerException(
          message: 'We have failed to process your request',
        );
      }
    } catch (e) {
      rethrow;
    }

    return movieListModel;
  }

  @override
  Future<MovieListModel> getSimilarMovies() {
    throw UnimplementedError();
  }

  @override
  Future<MovieModel> getMoviesDetails({required String id}) async {
    late MovieModel movieListModel;
    try {
      final uri = Uri(
        scheme: 'https',
        host: Urls.baseUrl,
        path: '${Urls.movieDetails}/$id',
        queryParameters: {
          'api_key': 'bb6677196e727a4bcaede556f2300d0b',
          'language': 'en-US',
        },
      );

      final response = await _api.get(uri);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        movieListModel = MovieModel.fromJson(data);
        print(response.body);
      } else if (response.statusCode == 400) {
        throw BadRequestException(
          message: 'The request was unacceptable,',
        );
      } else if (response.statusCode == 401) {
        throw UnAuthorizedtException(
            message: 'You are not authorized to get data');
      } else if (response.statusCode == 404) {
        throw NotFoundException(
            message: 'The requested resource doesn\'t exist.');
      } else if (response.statusCode == 429) {
        throw RateLimitExceededException(
            message: 'API request limit exceeded.');
      } else {
        throw InternalServerException(
          message: 'We have failed to process your request',
        );
      }
    } catch (e) {
      rethrow;
    }

    return movieListModel;
  }

  // try {
  //     final response = await _api.get(
  //       Uri.parse(
  //         Urls.baseUrl + Urls.symbols,
  //       ),
  //     );
  //     if (response.statusCode == 200) {
  //       final data =
  //           jsonDecode(response.body)['symbols'] as Map<String, dynamic>;

  //       data.forEach(
  //         (key, value) {
  //           symbols.add(
  //             CountrySymbolModel(
  //               name: value,
  //               symbol: key,
  //               flagUrl:
  //                   'https://countryflagsapi.com/png/${key.substring(0, key.length - 1)}',
  //             ),
  //           );
  //         },
  //       );
  //     } else if (response.statusCode == 400) {
  //       throw BadRequestException(
  //         message: 'The request was unacceptable,',
  //       );
  //     } else if (response.statusCode == 401) {
  //       throw UnAuthorizedtException(
  //           message: 'You are not authorized to get data');
  //     } else if (response.statusCode == 404) {
  //       throw NotFoundException(
  //           message: 'The requested resource doesn\'t exist.');
  //     } else if (response.statusCode == 429) {
  //       throw RateLimitExceededException(
  //           message: 'API request limit exceeded.');
  //     } else {
  //       throw InternalServerException(
  //         message: 'We have failed to process your request',
  //       );
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }

  //   return symbols;

}
