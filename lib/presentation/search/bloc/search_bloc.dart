import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/generMovie/generMovie.dart';
import 'package:movie_app/models/listMovie/moives_model.dart';
import 'package:movie_app/repository/api_moive.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final MovieRepository movieRepository;

  SearchBloc(this.movieRepository) : super(SearchState('', [], [], Genres())) {
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
      },
    );

    on<SearchEventGenreMoviesTab>((event, emit) async {
      final genreMovies = await movieRepository.getMoviesByGenre(
          genreId: event.selectedGenre.id!);

      emit(SearchState(
          state.keyWord, state.categories, genreMovies, event.selectedGenre));
    });
    // search
    on<SearchEventSearchMovies>((event, emit) async {
      if (event.keyWord.isEmpty) {
        // Nếu từ khóa rỗng, không tìm kiếm phim và reset danh sách phim
        emit(SearchState('', state.categories, [],
            state.tabCategories)); // Reset khi không có từ khóa
      } else {
        // Nếu từ khóa không rỗng, tìm kiếm phim dựa trên từ khóa
        final movies = await movieRepository.searchMovies(event.keyWord);
        emit(SearchState(
            event.keyWord, state.categories, movies, state.tabCategories));
      }
    });
  }
}
