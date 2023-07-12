import 'package:dio/dio.dart';

class SingleDio {
  static SingleDio? _instance;
  Dio? _dio;

  SingleDio._internal() {
    final options = BaseOptions(
      receiveTimeout: const Duration(seconds: 15),
      connectTimeout: const Duration(seconds: 15),
      validateStatus: (_) => true,
    );
    _dio = Dio(options);
  }

  factory SingleDio() {
    _instance ??= SingleDio._internal();
    return _instance!;
  }

  Dio get dioInstance => _dio!;
}
