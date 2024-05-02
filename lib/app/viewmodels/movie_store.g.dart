// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieStore on _MovieStore, Store {
  late final _$moviesAtom = Atom(name: '_MovieStore.movies', context: context);

  @override
  ObservableList<Movie> get movies {
    _$moviesAtom.reportRead();
    return super.movies;
  }

  @override
  set movies(ObservableList<Movie> value) {
    _$moviesAtom.reportWrite(value, super.movies, () {
      super.movies = value;
    });
  }

  late final _$fetchTopMoviesUSAsyncAction =
      AsyncAction('_MovieStore.fetchTopMoviesUS', context: context);

  @override
  Future<void> fetchTopMoviesUS() {
    return _$fetchTopMoviesUSAsyncAction.run(() => super.fetchTopMoviesUS());
  }

  @override
  String toString() {
    return '''
movies: ${movies}
    ''';
  }
}
