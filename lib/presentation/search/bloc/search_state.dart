part of 'search_bloc.dart';

class SearchState {
  final String keyWord;
  final List<String> categories;
  final List<Moives> movies;
  final String tabCategories;

  SearchState(this.keyWord, this.categories, this.movies, this.tabCategories);
}
