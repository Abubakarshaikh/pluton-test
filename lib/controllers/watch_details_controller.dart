import 'dart:developer';
import 'package:get/get.dart';
import 'package:pluton_test/models/movie.dart';

class WatchDetailsController extends GetxController {
  Rx<Movie>? movie;

  void fetchMovieDetail(Movie value) {
    movie = value.obs;
    log("WatchDetailsController $movie");
  }
}
