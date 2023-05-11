import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluton_test/controllers/watch_details_controller.dart';
import 'movie_detail_card.dart';

class WatchDetailsView extends StatelessWidget {
  const WatchDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<WatchDetailsController>();
    final height = MediaQuery.of(context).size.height;
    final movie = controller.movie?.value;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: height / 3,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: movie != null
                  ? controller.movie!.value.backdropPath
                  : "https://image.tmdb.org/t/p/w1280/5ik4ATKmNtmJU6AYD0bLm56BCVM.jpg",
              placeholder: (context, url) {
                return Container(
                  color: Colors.grey,
                );
              },
              errorWidget: (context, url, error) {
                return const Center(
                  child: Icon(Icons.error),
                );
              },
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: height / 3,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black12,
                    Colors.black87,
                    Color(0xFF131212),
                    Color(0xFF131212),
                    Color(0xFF131212),
                    Color(0xFF131212),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          Positioned(
            left: 24,
            right: 24,
            top: height / 3.4,
            bottom: 0,
            child: MovieDetailCard(
              movie: movie!,
            ),
          ),
          Positioned(
            bottom: 36,
            left: 0,
            right: 0,
            child: GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 66),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 14, 9, 150),
                          Color.fromARGB(255, 28, 24, 151),
                          Color.fromARGB(255, 40, 36, 158),
                          Color.fromARGB(255, 54, 49, 202),
                        ],
                      ),
                    ),
                    child: const Text("Resume Playing"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
