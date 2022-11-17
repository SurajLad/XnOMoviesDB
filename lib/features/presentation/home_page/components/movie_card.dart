import 'package:flutter/material.dart';
import 'package:xno_movies/core/design_system/app_colors.dart';
import 'package:xno_movies/core/design_system/text_styles.dart';
import 'package:xno_movies/features/domain/entities/movie_list.dart';

import '../../../../navigation/routes.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: movie.id,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            Routes.detailsPage,
            arguments: {
              'id': movie.id,
            },
          );
        },
        child: Container(
          height: 150,
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.only(left: 12, right: 12),
          decoration: BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Image.network(
                  movie.posterPath,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                flex: 7,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.primaryBodyBold,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Release Date : ${movie.releaseDate}',
                      style: AppTextStyles.tertiaryBody,
                    ),
                    Text(
                      'Language : ${movie.originalLanguage}',
                      style: AppTextStyles.tertiaryBody,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 12, right: 12, top: 6, bottom: 6),
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'Rating : ${movie.voteAverage}',
                        style: AppTextStyles.tertiaryBodyBold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
