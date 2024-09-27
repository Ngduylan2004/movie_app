import 'package:dio/dio.dart';

class MovieService {
  final Dio _dio = Dio();
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular';
  final String baseUrlGenre = 'https://api.themoviedb.org/3/genre/movie/list';
  final String baseUrlTrending =
      'https://api.themoviedb.org/3/trending/movie/week'; // Đã chỉnh sửa để chỉ định rõ ràng thời gian
  final String apiKey = '4e7280df6a23b84a9fc51090b1135694';

  // Future<List<dynamic>> fetchPopularMovies(int page) async {
  //   final response = await _dio.get(baseUrl, queryParameters: {
  //     'api_key': apiKey,
  //     'language': 'en-US',
  //     'page': page,
  //   });

  //   return response.data['results'] ?? [];
  // }
  Future<List<dynamic>> fetchListMovies(int idGenre) async {
    final response = await _dio.get(baseUrl, queryParameters: {
      'api_key': apiKey,
      'language': 'en-US',
      'with_genres': idGenre,
    });

    return response.data['results'] ?? [];
  }

  // Lấy danh sách phim xu hướng
  Future<List<dynamic>> fetchTrendingMovies() async {
    try {
      final response = await _dio.get(baseUrlTrending, queryParameters: {
        'api_key': apiKey,
      });

      // Kiểm tra xem phản hồi có chứa dữ liệu không
      if (response.statusCode == 200) {
        return response.data['results'] ?? [];
      } else {
        throw Exception(
            'Failed to load trending movies: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching trending movies: $e');
      return []; // Trả về danh sách rỗng nếu có lỗi
    }
  }

  //get genre
  Future<List<dynamic>> fetGenerMovies() async {
    final reposen = await _dio.get(baseUrlGenre, queryParameters: {
      'api_key': apiKey,
      'language': 'en-US',
    });
    return reposen.data['genres'] ?? [];
  }
}
