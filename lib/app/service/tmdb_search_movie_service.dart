import 'dart:convert';
import 'package:http/http.dart' as http;

class TMDBSearchMovieSService {
  static const String _baseUrl = 'https://api.themoviedb.org/3';
  static const String _apiKey = '79432789a64469a8665e4f0de305caf6';

  Future<List<Map<String, dynamic>>> searchMovies(String query) async {
    var url = Uri.parse('$_baseUrl/search/movie?api_key=$_apiKey&query=$query');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(decodedData['results']);
    } else {
      throw Exception('Failed to search movies: ${response.statusCode}');
    }
  }
}
