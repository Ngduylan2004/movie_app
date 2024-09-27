part of 'search_bloc.dart';

sealed class SearchEvent {}

class SearchEventGenreMovies extends SearchEvent {}

class SearchEventGenreMoviesTab extends SearchEvent {
  final Genres selectedGenre;

  SearchEventGenreMoviesTab(this.selectedGenre);
}

class SearchEventLoadMovies extends SearchEvent {}
