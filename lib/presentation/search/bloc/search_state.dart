part of 'search_bloc.dart';

class SearchState {
  final String keyWord;
  final List<Genres> categories;
  final List<Moives> movies;
  final Genres tabCategories;

  SearchState(this.keyWord, this.categories, this.movies, this.tabCategories);
}
