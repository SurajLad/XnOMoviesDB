import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:xno_movies/core/design_system/app_colors.dart';
import 'package:xno_movies/core/design_system/text_styles.dart';
import 'package:xno_movies/features/domain/usecases/movies_usecase.dart';
import 'package:xno_movies/features/presentation/movie_detail/movie_detail_controller.dart';

import '../../../navigation/router.dart';
import '../home_page/controllers/states.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments = AppNavigator.getArguments(context);
    String id = arguments['id']?.toString() ?? '';

    return InheritedProvider<MovieDetailController>(
      create: (context) => MovieDetailController(
        usecase: GetIt.I.get<XnOMoviesUsecase>(),
        id: id,
      ),
      builder: (context, child) {
        final controller = Provider.of<MovieDetailController>(context);
        return Scaffold(
          body: Obx(
            () {
              switch (controller.pageState.value) {
                case PageState.loading:
                  return const CircularProgressIndicator();

                case PageState.data:
                  final movieDetail = controller.movieDetail.value;
                  return Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              movieDetail.posterPath,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              AppColors.primaryBackground,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.center,
                            tileMode: TileMode.clamp,
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height / 2.5,
                        left: 24,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movieDetail.originalTitle,
                              style: AppTextStyles.largeHeading,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '${movieDetail.releaseDate} - ${movieDetail.originalLanguage.capitalizeFirst} ',
                              style: AppTextStyles.tertiaryBody,
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 30,
                              child: Text(
                                movieDetail.overview,
                                style: AppTextStyles.tertiaryBody,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '\$${movieDetail.revenue} - ${durationToString(movieDetail.runtime)} ',
                              style: AppTextStyles.tertiaryBody,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Ratiing - ${movieDetail.voteAverage} ',
                              style: AppTextStyles.tertiaryBody,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Genres - ${movieDetail.genres.map((e) => e.name)} ',
                              style: AppTextStyles.tertiaryBody,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Popularity - ${movieDetail.popularity} ',
                              style: AppTextStyles.tertiaryBody,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 40,
                        left: 15,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_rounded,
                            color: AppColors.white,
                            size: 28,
                          ),
                        ),
                      ),
                    ],
                  );
                case PageState.error:
                  return Container();
              }
            },
          ),
        );
      },
    );
  }

  String durationToString(int minutes) {
    var d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')} hr: ${parts[1].padLeft(2, '0')} min';
  }
}
