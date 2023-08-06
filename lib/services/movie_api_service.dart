import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/movie_model.dart';

class MovieApiService {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";
  static const String popular = "popular";

  static Future<List<MovieModel>> getMovies() async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse('$baseUrl/$popular');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> movies = jsonDecode(response.body)['results'];

      for (var movie in movies) {
        movieInstances.add(MovieModel.fromJson(movie));
      }

      return movieInstances;
    }
    throw Error();
  }
}
