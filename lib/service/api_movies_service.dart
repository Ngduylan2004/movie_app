import 'dart:async';

import 'api_service.dart'; // Đảm bảo import ApiService

class ApiMoviesService {
  final ApiService _apiService;

  ApiMoviesService(this._apiService);

  // Lấy danh sách thể loại phim
  Future<List<dynamic>> fetchGenreMovies() async {
    const String baseUrlGenre = '/genre/movie/list';

    try {
      final response =
          await _apiService.dio.get(baseUrlGenre, queryParameters: {
        'language': 'en-US',
      });
      return response.data['genres'] ?? [];
    } catch (e) {
      print('Lỗi khi lấy danh sách thể loại: $e');
      return []; // Trả về danh sách rỗng nếu có lỗi
    }
  }

  // Lấy danh sách phim theo thể loại
  Future<List<dynamic>> fetchListMovies(int idGenre) async {
    const String baseUrl = '/discover/movie';

    try {
      final response = await _apiService.dio.get(baseUrl, queryParameters: {
        'language': 'en-US',
        'with_genres': idGenre,
      });

      if (response.statusCode == 200) {
        return response.data['results'] ?? [];
      } else {
        throw Exception('Không thể tải phim: ${response.statusCode}');
      }
    } catch (e) {
      print('Lỗi khi lấy danh sách phim: $e');
      return [];
    }
  }

  // api get search
  Future<List<dynamic>> fetchMoviesBySearch(String keyWord) async {
    const String baseUrlSearching = '/search/movie';
    final response =
        await _apiService.dio.get(baseUrlSearching, queryParameters: {
      'query': keyWord,
    });
    return response.data['results'] ?? [];
  }

  // Lấy danh sách phim xu hướng
  Future<List<dynamic>> fetchTrendingMovies() async {
    const String baseUrlTrending = '/trending/movie/week';

    try {
      final response =
          await _apiService.dio.get(baseUrlTrending, queryParameters: {});

      if (response.statusCode == 200) {
        return response.data['results'] ?? [];
      } else {
        throw Exception('Không thể tải phim xu hướng: ${response.statusCode}');
      }
    } catch (e) {
      print('Lỗi khi lấy danh sách phim xu hướng: $e');
      return []; // Trả về danh sách rỗng nếu có lỗi
    }
  }
}
