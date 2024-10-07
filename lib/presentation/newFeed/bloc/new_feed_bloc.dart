import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/entities/movies_entities.dart';
import 'package:movie_app/domain/repostory/movies_repostory.dart';

part 'new_feed_event.dart';
part 'new_feed_state.dart';

class NewFeedBloc extends Bloc<NewFeedEvent, NewFeedState> {
  final MoviesRepository movieRepository;
  NewFeedBloc(this.movieRepository) : super(NewFeedState([])) {
    on<NewFeedEventTreding>(
      (event, emit) async {
        final TrendingMoives = await movieRepository.getTrendingMovies();
        emit(
          NewFeedState(TrendingMoives),
        );
      },
    );
  }
}
