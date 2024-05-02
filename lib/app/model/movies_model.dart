class Movie {
  final int id;
  final String title;
  final String posterPath;
  final String overview;

  Movie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
  });

  factory Movie.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('json cannot be null');
    }

    return Movie(
        id: json['id'] ?? 0, // Ou algum valor padrão se 'id' for nulo
        title: json['title'] ?? '', // Ou algum valor padrão se 'title' for nulo
        posterPath: json['poster_path'] ?? '',
        overview: json['overview'] ?? '' // Ou algum valor padrão se 'poster_path' for nulo
        );
  }
}
