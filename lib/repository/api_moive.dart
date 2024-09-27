import 'package:movie_app/models/generMovie/generMovie.dart';
import 'package:movie_app/models/listMovie/moives_model.dart';
import 'package:movie_app/models/listMovieTrending/list_movie_treding.dart';
import 'package:movie_app/service/api_list_movie.dart';

// note
class MovieRepository {
  final MovieService _movieService = MovieService(); //note

  // get genre movie
  Future<List<Genres>> getGenres() async {
    final moviGenre = await _movieService.fetGenerMovies();
    return moviGenre
        .map<Genres>(
          (movie) => Genres.fromJson(movie),
        )
        .toList();
  }

  // get list movie
  // Future<List<Moives>> getPopularMovies(int page) async {
  //   final moviesData = await _movieService.fetchPopularMovies(page);
  //   return moviesData.map((movie) => Moives.fromJson(movie)).toList();
  // }
  Future<List<Moives>> getListMovies(int page) async {
    final moviesData = await _movieService.fetchListMovies(page);
    return moviesData.map((movie) => Moives.fromJson(movie)).toList();
  }

  Future<List<Moives>> getMoviesByGenre({String? name}) async {
    final moviGenre = await _movieService.fetGenerMovies();
    return moviGenre
        .map<Moives>(
          (moivie) => Moives.fromJson(moivie),
        )
        .toList();
  }

  // get Treding movies
  Future<List<ListMovieTrending>> getTrendingMoives() async {
    final movieTrending = await _movieService.fetchTrendingMovies();
    return movieTrending
        .map((listMovieTrending) =>
            ListMovieTrending.fromJson(listMovieTrending))
        .toList();
  }
}
