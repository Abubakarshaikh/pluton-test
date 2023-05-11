import 'dart:developer';

import 'package:get/get.dart';
import 'package:pluton_test/get_trending_movie.dart';
import 'package:pluton_test/models/movie.dart';

class WatchController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<Movie> trendingMovies = RxList<Movie>();

  @override
  void onInit() async {
    await fetchTrendingMovies();
    super.onInit();
  }

  Future<void> fetchTrendingMovies() async {
      isLoading.value = true;

    try {
      final response = await getTrendingMovie();
      trendingMovies.assignAll(response);
    } catch (e) {
      log("Something went wrong: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
