import 'dart:convert';
import 'package:http/http.dart' as http;

class TMDBDetailsService {
  static const apiKey = '79432789a64469a8665e4f0de305caf6';
  static const baseUrl = 'https://api.themoviedb.org/3';

  Future<Map<String, dynamic>> getMovieDetails(int movieId) async {
    final uri = Uri.parse('$baseUrl/movie/$movieId?api_key=$apiKey&language=pt-BR&append_to_response=credits');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load movie details');
    }
  }
}
