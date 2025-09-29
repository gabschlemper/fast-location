import 'package:dio/dio.dart';

class DioClient {
  DioClient._internal() {
    _dio = Dio(BaseOptions(
      baseUrl: 'https://viacep.com.br',
      connectTimeout: 10000, // 10 seconds in milliseconds
      receiveTimeout: 10000, // 10 seconds in milliseconds
      sendTimeout: 10000, // 10 seconds in milliseconds
      headers: {'Accept': 'application/json'},
    ));
  }

  static final DioClient instance = DioClient._internal();

  late final Dio _dio;

  Dio get dio => _dio;
}