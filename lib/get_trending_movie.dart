import 'dart:convert';
import 'package:pluton_test/models/movie.dart';
import 'package:http/http.dart' as http;

final _httpClient = http.Client();

Future<List<Movie>> getTrendingMovie() async {
  try {
    const key = "39cf98d7db1ad3069227393fa6315d10";
    final url = Uri.https(
      "api.themoviedb.org",
      "/3/trending/all/day",
      {
        "api_key": key,
      },
    );
    final response = await _httpClient.get(url);
    final fromJson = json.decode(response.body);
    final movies = fromJson["results"] as List<dynamic>;

    return movies.map((movie) => Movie.fromJson(movie)).toList();
  } catch (e) {
    throw Exception("Something went wrong $e");
  }
}
