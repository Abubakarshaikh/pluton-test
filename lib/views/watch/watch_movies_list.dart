import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluton_test/models/movie.dart';
import '../../controllers/watch_details_controller.dart';
import '../watch_details/watch_details_view.dart';

class WatchMoviesList extends StatelessWidget {
  const WatchMoviesList({
    Key? key,
    required this.movies,
  }) : super(key: key);

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      scrollDirection: Axis.horizontal,
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies.elementAt(index);
        return AspectRatio(
          aspectRatio: 3 / 5,
          child: Hero(
            tag: movie,
            child: GestureDetector(
              onTap: () {
                Get.put(WatchDetailsController()).fetchMovieDetail(movie);
                Get.to(() => const WatchDetailsView());
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: movie.posterPath,
                      placeholder: (context, url) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.grey,
                          ),
                        );
                      },
                      errorWidget: (context, url, error) {
                        return const Center(
                          child: Icon(Icons.error),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 4),
                  Expanded(
                    child: Text(
                      movie.title.isEmpty ? "Kong : Skull Island" : movie.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
