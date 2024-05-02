import 'dart:convert';

import 'package:http/http.dart' as http;

class TMDBService {
  static const apiKey = '79432789a64469a8665e4f0de305caf6';
  static const baseUrl = 'https://api.themoviedb.org/3';

  Future<List<Map<String, dynamic>>> getTopMoviesUS() async {
    final uri = Uri.parse('$baseUrl/movie/top_rated?api_key=$apiKey&language=en-US&page=1&region=US');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['results'] as List<dynamic>;
      return results.cast<Map<String, dynamic>>();
    } else {
      // Tratar erros de resposta HTTP
      throw Exception('Failed to load top movies: ${response.statusCode}');
    }
  }
}
