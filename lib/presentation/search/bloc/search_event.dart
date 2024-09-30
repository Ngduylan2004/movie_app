part of 'search_bloc.dart';

sealed class SearchEvent {}

class SearchEventGenreMovies extends SearchEvent {}

class SearchEventGenreMoviesTab extends SearchEvent {
  final Genres selectedGenre; // note

  SearchEventGenreMoviesTab(this.selectedGenre);
}

class SearchEventLoadMovies extends SearchEvent {}

class SearchEventSearchMovies extends SearchEvent {
  final String keyWord;

  SearchEventSearchMovies({required this.keyWord});
}
