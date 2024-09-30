import 'package:movie_app/models/generMovie/generMovie.dart';
import 'package:movie_app/models/listMovie/moives_model.dart';
import 'package:movie_app/models/listMovieTrending/list_movie_treding.dart';
import 'package:movie_app/service/api_movies_service.dart';
import 'package:movie_app/service/api_service.dart';

class MovieRepository {
  final ApiMoviesService _movieService =
      ApiMoviesService(ApiService.istant); // Khởi tạo ApiMoviesService

  // Lấy danh sách thể loại phim
  Future<List<Genres>> getGenres() async {
    final genreData = await _movieService.fetchGenreMovies();
    return genreData.map<Genres>((genre) => Genres.fromJson(genre)).toList();
  }

  // Lấy danh sách phim theo trang
  Future<List<Moives>> getListMovies(int page) async {
    final moviesData = await _movieService.fetchListMovies(page);
    return moviesData.map<Moives>((movie) => Moives.fromJson(movie)).toList();
  }

  // Lấy danh sách phim theo thể loại
  Future<List<Moives>> getMoviesByGenre({required int genreId}) async {
    final moviesData = await _movieService.fetchListMovies(genreId);
    return moviesData.map<Moives>((movie) => Moives.fromJson(movie)).toList();
  }

  // Lấy danh sách phim xu hướng
  Future<List<ListMovieTrending>> getTrendingMovies() async {
    final trendingData = await _movieService.fetchTrendingMovies();
    return trendingData
        .map<ListMovieTrending>((movie) => ListMovieTrending.fromJson(movie))
        .toList();
  }

  // search
  Future<List<Moives>> searchMovies(String keyword) async {
    final searchData = await _movieService.fetchMoviesBySearch(keyword);
    return searchData.map<Moives>((movie) => Moives.fromJson(movie)).toList();
  }
}
