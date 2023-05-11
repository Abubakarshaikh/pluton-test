import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../models/movie.dart';

class MovieDetailCard extends StatelessWidget {
  const MovieDetailCard({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Hero(
              tag: movie,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                width: 120,
                height: 160,
                imageUrl: movie.posterPath.isEmpty
                    ? "https://image.tmdb.org/t/p/w1280/5ik4ATKmNtmJU6AYD0bLm56BCVM.jpg"
                    : movie.posterPath,
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
            const SizedBox(width: 12),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 36),
                  Text(
                    movie.title.isEmpty ? "Kong : Skull Island" : movie.title,
                    style: theme.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(
                        color: Colors.white,
                        width: 0.8,
                      ),
                    ),
                    child: Text(
                      "+12",
                      style: theme.bodySmall!.copyWith(
                        height: 1.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: const [
                      Icon(
                        Icons.star,
                        size: 14.5,
                        color: Color(0xFFFFBD5A),
                      ),
                      Icon(
                        Icons.star,
                        size: 14.5,
                        color: Color(0xFFFFBD5A),
                      ),
                      Icon(
                        Icons.star,
                        size: 14.5,
                        color: Color(0xFFFFBD5A),
                      ),
                      Icon(
                        Icons.star,
                        size: 14.5,
                        color: Color(0xFFFFBD5A),
                      ),
                      Icon(
                        Icons.star_border,
                        size: 14.5,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "2017 - Adventure",
                    style: theme.bodySmall,
                  ),
                  Text(
                    "2 hr 09 min",
                    style: theme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          "Directed by John Vogt - Roberrt",
          style: theme.bodyMedium,
        ),
        const SizedBox(height: 16),
        Text(
          "The Cast",
          style: theme.bodyMedium,
        ),
        SizedBox(
          height: 80,
          child: ListView.separated(
            itemCount: 7,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              int imgIndex = index + 1;
              return CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage(
                  "assets/img$imgIndex.jpeg",
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 12),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "Storyline",
          style: theme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w200,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          movie.overview,
          style: theme.bodySmall!.copyWith(
            fontSize: 11.5,
          ),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
