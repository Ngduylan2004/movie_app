import 'package:movie_app/models/generMovie/generMovie.dart';
import 'package:movie_app/models/listMovie/moives_model.dart';
import 'package:movie_app/service/api_list_movie.dart';

// note
class MovieRepository {
  final MovieService _movieService = MovieService(); //note

  // get genre movie
  Future<List<String>> getGenreMovies() async {
    final moviGenre = await _movieService.fetGenerMovies();
    return moviGenre
        .map<String>((genre) => Genres.fromJson(genre).name!)
        .toList();
  }

  // get list movie
  Future<List<Moives>> getPopularMovies(int page) async {
    final moviesData = await _movieService.fetchPopularMovies(page);
    return moviesData.map((movie) => Moives.fromJson(movie)).toList();
  }
}
