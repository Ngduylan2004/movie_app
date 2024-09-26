import 'package:dio/dio.dart';

class MovieService {
  final Dio _dio = Dio();
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular';
  final String baseUrlGenre = 'https://api.themoviedb.org/3/genre/movie/list';
  final String apiKey = '4e7280df6a23b84a9fc51090b1135694';

  Future<List<dynamic>> fetchPopularMovies(int page) async {
    final response = await _dio.get(baseUrl, queryParameters: {
      'api_key': apiKey,
      'language': 'en-US',
      'page': page,
    });

    return response.data['results'] ?? [];
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
