import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/listMovieTrending/list_movie_treding.dart';
import 'package:movie_app/repository/api_moive.dart';

part 'new_feed_event.dart';
part 'new_feed_state.dart';

class NewFeedBloc extends Bloc<NewFeedEvent, NewFeedState> {
  final MovieRepository movieRepository = MovieRepository();
  NewFeedBloc() : super(NewFeedState([])) {
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
