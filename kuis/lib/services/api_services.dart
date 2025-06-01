import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kuis/models/movies.dart';
class ApiService {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = 'ecd5b131017b1d0be50c940f3a8fb446';
  Future<List<Map<String, dynamic>>> getAllMovies() async {
    final response = await
    http.get(Uri.parse("$baseUrl/movie/now_playing?api_key=$apiKey"));
    final data = json.decode(response.body);
    return List<Map<String, dynamic>>.from(data['results']);
  }
  Future<List<Map<String, dynamic>>> getTrendingMovies() async {
    final response = await
    http.get(Uri.parse("$baseUrl/trending/movie/week?api_key=$apiKey"));
    final data = json.decode(response.body);
    return List<Map<String, dynamic>>.from(data['results']);
  }
  Future<List<Map<String, dynamic>>> getPopularMovies() async {
    final response = await
    http.get(Uri.parse("$baseUrl/movie/popular?api_key=$apiKey"));
    final data = json.decode(response.body);
    return List<Map<String, dynamic>>.from(data['results']);
  }
  Future<List<Movie>> searchMovies(String query) async {
  final response = await http.get(Uri.parse("$baseUrl/search/movie?query=$query&api_key=$apiKey"));

  if (response.statusCode != 200) {
    throw Exception("Gagal mengambil data dari API");
  }

  final data = json.decode(response.body);

  return List<Map<String, dynamic>>.from(data['results'])
      .where((movie) =>
          movie['id'] != null &&
          movie['title'] != null &&
          movie['overview'] != null &&
          movie['poster_path'] != null &&
          movie['backdrop_path'] != null &&
          movie['release_date'] != null &&
          movie['vote_average'] != null)
      .map((e) => Movie.fromJson(e))
      .toList();
}

}