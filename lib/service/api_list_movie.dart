// import 'package:dio/dio.dart';

// class MovieService {
//   final Dio _dio = Dio();
//   final String baseUrl =
//       'https://api.themoviedb.org/3/discover/movie'; // Cập nhật URL cho việc tìm kiếm phim
//   final String baseUrlGenre = 'https://api.themoviedb.org/3/genre/movie/list';
//   final String baseUrlTrending =
//       'https://api.themoviedb.org/3/trending/movie/week';
//   final String apiKey = '4e7280df6a23b84a9fc51090b1135694';

//   // Lấy danh sách phim theo thể loại
//   Future<List<dynamic>> fetchListMovies(int idGenre) async {
//     try {
//       final response = await _dio.get(baseUrl, queryParameters: {
//         'api_key': apiKey,
//         'language': 'en-US',
//         'with_genres': idGenre,
//       });

//       // Kiểm tra phản hồi và trả về danh sách phim
//       if (response.statusCode == 200) {
//         return response.data['results'] ?? [];
//       } else {
//         throw Exception('Failed to load movies: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error fetching movies: $e');
//       return []; // Trả về danh sách rỗng nếu có lỗi
//     }
//   }

//   // Lấy danh sách phim xu hướng
//   Future<List<dynamic>> fetchTrendingMovies() async {
//     try {
//       final response = await _dio.get(baseUrlTrending, queryParameters: {
//         'api_key': apiKey,
//       });

//       if (response.statusCode == 200) {
//         return response.data['results'] ?? [];
//       } else {
//         throw Exception(
//             'Failed to load trending movies: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error fetching trending movies: $e');
//       return []; // Trả về danh sách rỗng nếu có lỗi
//     }
//   }

//   // Lấy danh sách thể loại
//   Future<List<dynamic>> fetGenerMovies() async {
//     try {
//       final response = await _dio.get(baseUrlGenre, queryParameters: {
//         'api_key': apiKey,
//         'language': 'en-US',
//       });
//       return response.data['genres'] ?? [];
//     } catch (e) {
//       print('Error fetching genres: $e');
//       return []; // Trả về danh sách rỗng nếu có lỗi
//     }
//   }
// }
