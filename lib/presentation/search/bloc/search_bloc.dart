import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/generMovie/generMovie.dart';
import 'package:movie_app/models/listMovie/moives_model.dart';
import 'package:movie_app/repository/api_moive.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final MovieRepository movieRepository;

  SearchBloc(this.movieRepository) : super(SearchState('', [], [], Genres())) {
    // on<SearchEventLoadMovies>(
    //   (event, emit) async {
    //     final movies = await movieRepository.getPopularMovies(9);
    //     emit(SearchState(
    //         state.keyWord, state.categories, movies, state.tabCategories));
    //   },
    // );
    //
    on<SearchEventLoadMovies>(
      (event, emit) async {
        final movies = await movieRepository.getListMovies(28);
        emit(SearchState(
            state.keyWord, state.categories, movies, state.tabCategories));
      },
    );
    on<SearchEventGenreMovies>(
      (event, emit) async {
        final genreMovies = await movieRepository.getGenres();
        emit(SearchState(
            state.keyWord, genreMovies, state.movies, genreMovies[0]));
        add(SearchEventGenreMovies());
      },
    );
    on<SearchEventGenreMoviesTab>((event, emit) async {
      // Kiểm tra event.selectedGenre có kiểu dữ liệu là Genres không
      final genreMovies = await movieRepository.getMoviesByGenre(
          name: event.selectedGenre.name);
      emit(SearchState(
          state.keyWord, state.categories, genreMovies, event.selectedGenre));
    });
  }
}
