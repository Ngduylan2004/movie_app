import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/listMovie/moives_model.dart';
import 'package:movie_app/repository/api_moive.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final MovieRepository movieRepository;

  SearchBloc(this.movieRepository) : super(SearchState('', [], [], '')) {
    on<SearchEventLoadMovies>(
      (event, emit) async {
        final movies = await movieRepository.getPopularMovies(2);
        emit(SearchState(
            state.keyWord, state.categories, movies, state.tabCategories));
      },
    );
    on<SearchEventGenreMovies>(
      (event, emit) async {
        final genreMovies = await movieRepository.getGenreMovies();
        emit(SearchState(
            state.keyWord, genreMovies, state.movies, genreMovies[0]));
        add(SearchEventGenreMovies());
      },
    );
  }
}
