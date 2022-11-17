import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:xno_movies/core/design_system/app_colors.dart';
import 'package:xno_movies/features/presentation/home_page/controllers/home_controller.dart';

import '../../../core/design_system/text_styles.dart';
import 'components/movie_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = GetIt.I.get<HomeController>();
  final scrollController = ScrollController();
  final isLoading = false.obs;

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        if (!isLoading.value) {
          isLoading.value = !isLoading.value;
          // Load Next Set of data
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.primaryBackground,
          appBar: const _AppBar(),
          body: Obx(
            () {
              return ListView.builder(
                controller: scrollController,
                itemBuilder: (context, index) {
                  return MovieCard(movie: homeController.movies[index]);
                },
                itemCount: homeController.movies.length,
              );
            },
          ),
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Top Movies',
            style: AppTextStyles.mediumHeading,
          ),
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.search,
              color: AppColors.white,
              size: 32,
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
