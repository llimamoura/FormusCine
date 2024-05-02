import 'package:flutter_formuscine/app/model/movies_model.dart';
import 'package:flutter_formuscine/app/service/tmdb_service.dart';
import 'package:mobx/mobx.dart';

part 'movie_store.g.dart';

class MovieStore = _MovieStore with _$MovieStore;

abstract class _MovieStore with Store {
  final TMDBService _tmdbService = TMDBService();

  @observable
  ObservableList<Movie> movies = ObservableList<Movie>();

  @observable
  ObservableList<Movie> searchResults = ObservableList<Movie>();

  @action
  Future<void> fetchTopMoviesUS() async {
    final topMovies = await _tmdbService.getTopMoviesUS();
    movies.clear();
    movies.addAll(
      topMovies.map((movieData) => Movie(
            id: movieData['id'],
            title: movieData['title'],
            posterPath: movieData['poster_path'],
            overview: movieData['overview'],
          )),
    );
  }

  @action
  void setSearchResults(List<Movie> results) {
    searchResults.clear();
    searchResults.addAll(results);
  }
}
