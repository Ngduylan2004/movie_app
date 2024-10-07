import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/entities/genre_movies_entities.dart';
import 'package:movie_app/domain/entities/movies_entities.dart';
import 'package:movie_app/domain/repostory/movies_repostory.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final MoviesRepository movieRepository;

  SearchBloc(this.movieRepository)
      : super(SearchState('', [], [], GenreMoviesEntities(id: 0, name: ''))) {
    on<SearchEventLoadMovies>(
      (event, emit) async {
        final categories = await movieRepository.getGenres();
        final genre = categories[0];
        // final listMovies =
        //     await movieRepository.getMoviesByGenre(genreId: genre.id!);
        emit(SearchState(state.keyWord, categories, [], genre));
        add(SearchEventLoadMoviesByGenre());
      },
    );
    on<SearchEventLoadMoviesByGenre>((event, emit) async {
      final listMovies =
          await movieRepository.getMoviesByGenre(state.tabCategories.id);
      emit(SearchState(
          state.keyWord, state.categories, listMovies, state.tabCategories));
    });

    on<SearchEventGenreMovies>(
      (event, emit) async {
        final genreMovies = await movieRepository.getGenres();
        emit(SearchState(
            state.keyWord, genreMovies, state.movies, genreMovies[0]));
      },
    );

    on<SearchEventGenreMoviesTab>((event, emit) async {
      final genreMovies =
          await movieRepository.getMoviesByGenre(event.selectedGenre.id);

      emit(SearchState(
          state.keyWord, state.categories, genreMovies, event.selectedGenre));
    });

    on<SearchKeyWordMovies>((event, emit) async {
      final filteredMovies = state.movies.where((movie) {
        return movie.title!.toLowerCase().contains(event.keyWord.toLowerCase());
      }).toList();
      emit(SearchState(state.keyWord, state.categories, filteredMovies,
          state.tabCategories));
    });
  }
}
