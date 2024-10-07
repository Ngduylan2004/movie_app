import 'package:movie_app/data/data_source/remote/api_movies_service.dart';
import 'package:movie_app/data/model/genre_movies.dart';
import 'package:movie_app/data/model/movies_model.dart';
import 'package:movie_app/domain/entities/genre_movies_entities.dart';
import 'package:movie_app/domain/entities/movies_entities.dart';
import 'package:movie_app/domain/repostory/movies_repostory.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  static final MoviesRepositoryImpl _moviesRepositoryImpl =
      MoviesRepositoryImpl(ApiMoviesService.instance);
  static MoviesRepositoryImpl get instance => _moviesRepositoryImpl;

  final ApiMoviesService _movieService;

  MoviesRepositoryImpl(this._movieService);

  // lọc lấy theo tên thể loại

  @override
  Future<List<GenreMoviesEntities>> getGenres() async {
    final genreData = await _movieService.fetchGenreMovies();
    return genreData
        .map<GenreMoviesModel>((genre) => GenreMoviesModel.fromJson(genre))
        .toList();
  }

  @override
  Future<List<MoviesEntities>> getMoviesByGenre(int genreId) async {
    final moviesData = await _movieService.fetchListMovies(genreId);
    return moviesData
        .map<MoviesModel>((movie) => MoviesModel.fromJson(movie))
        .toList();
  }

  @override
  Future<List<MoviesEntities>> getTrendingMovies() async {
    final trendingData = await _movieService.fetchTrendingMovies();
    return trendingData
        .map<MoviesModel>((movie) => MoviesModel.fromJson(movie))
        .toList();
  }
}
