part of 'search_bloc.dart';

sealed class SearchEvent {}

class SearchEventGenreMovies extends SearchEvent {}

class SearchEventGenreMoviesTab extends SearchEvent {}

class SearchEventLoadMovies extends SearchEvent {}
