import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/entities/movies_entities.dart';
import 'package:movie_app/domain/repostory/movies_repostory.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final MoviesRepository moviesRepository;
  DetailBloc(this.moviesRepository) : super(DetailState([])) {
    on<DetailEventRelateMovies>(
      (event, emit) async {
        final relateMovies =
            await moviesRepository.getMoviesByGenre(event.genreId);

        emit(DetailState(relateMovies));
      },
    );
  }
}
