import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Để lấy API_KEY từ file .env

class ApiService {
  static final ApiService _apiService =
      ApiService(dotenv.env['BASE_URL'] ?? 'default_base_url');
  static ApiService get istant => _apiService;

  final Dio _dio;

  ApiService(String baseUrl) : _dio = Dio(BaseOptions(baseUrl: baseUrl)) {
    // Thêm Interceptor vào Dio
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Trước khi gửi request (có thể thêm header, token,...)
          print('Sending request to: ${options.uri}');

          // Tự động thêm API key vào tất cả các request nếu cần
          options.queryParameters.addAll({
            'api_key':
                dotenv.env['API_KEY'] ?? 'default_api_key', // Lấy từ file .env
          });

          // Ví dụ: Thêm token vào Header nếu cần
          // options.headers['Authorization'] = 'Bearer $token';

          return handler.next(options); // Tiếp tục gửi request
        },
        onResponse: (response, handler) {
          // Sau khi nhận được response
          print('Received response: ${response.statusCode}');

          return handler.next(response); // Tiếp tục xử lý response
        },
        onError: (DioException e, handler) {
          // Xử lý khi có lỗi xảy ra
          print('Error occurred: ${e.response?.statusCode}');

          return handler.next(e); // Tiếp tục xử lý lỗi
        },
      ),
    );
  }
  Dio get dio => _dio;
}
