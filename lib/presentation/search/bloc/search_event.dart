part of 'search_bloc.dart';

sealed class SearchEvent {}

class SearchEventGenreMovies extends SearchEvent {}

class SearchEventGenreMoviesTab extends SearchEvent {
  final GenreMoviesEntities selectedGenre; // note

  SearchEventGenreMoviesTab(this.selectedGenre);
}

class SearchEventLoadMovies extends SearchEvent {}

//
class SearchEventLoadMoviesByGenre extends SearchEvent {}

class SearchKeyWordMovies extends SearchEvent {
  final String keyWord;

  SearchKeyWordMovies({required this.keyWord});
}
