import 'package:movie_app/domain/entities/genre_movies_entities.dart';
import 'package:movie_app/domain/entities/movies_entities.dart';

abstract class MoviesRepository {
  Future<List<GenreMoviesEntities>> getGenres();
  Future<List<MoviesEntities>> getMoviesByGenre(int genreId);
  Future<List<MoviesEntities>> getTrendingMovies();

  // Future<List<MoviesEntities>> searchMovies(String keyword);
}
