// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluton_test/controllers/watch_controller.dart';
import 'watch_movies_list.dart';

class WatchView extends StatelessWidget {
  const WatchView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WatchController());
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(CupertinoIcons.line_horizontal_3_decrease),
        title: const Text("Watch"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Obx(
              () {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CupertinoActivityIndicator(
                      color: Colors.white,
                    ),
                  );
                } else {
                  return CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: controller.trendingMovies.isNotEmpty
                        ? controller.trendingMovies.last.backdropPath
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
                  );
                }
              },
            ),
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.only(left: 18),
            child: Text("Watch Movies"),
          ),
          const SizedBox(height: 12),
          Expanded(child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(
                child: CupertinoActivityIndicator(
                  color: Colors.white,
                ),
              );
            } else {
              return WatchMoviesList(movies: controller.trendingMovies);
            }
          })),
          const SizedBox(height: 12),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(
            label: "home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "movie",
            icon: Icon(Icons.movie),
          ),
          BottomNavigationBarItem(
            label: "edit",
            icon: Icon(Icons.movie_edit),
          ),
        ],
      ),
    );
  }
}
