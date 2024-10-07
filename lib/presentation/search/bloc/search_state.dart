part of 'search_bloc.dart';

class SearchState {
  final String keyWord;
  final List<GenreMoviesEntities> categories;
  final List<MoviesEntities> movies;
  final GenreMoviesEntities tabCategories;

  SearchState(this.keyWord, this.categories, this.movies, this.tabCategories);
}
