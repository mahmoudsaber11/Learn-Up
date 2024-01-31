import 'package:dio/dio.dart';

class DioConsumer {
  final Dio dio;

  DioConsumer({required this.dio});

  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) async {
    final Response response =
        await dio.post(path, queryParameters: queryParameters, data: data);
    return response;
  }
}
