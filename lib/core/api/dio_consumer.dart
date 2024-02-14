import 'package:dio/dio.dart';
import 'package:learn_up/core/api/api_consumer.dart';

class DioConsumer implements ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio});
  @override
  Future delete(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data}) async {
    final Response response =
        await dio.delete(path, queryParameters: queryParameters, data: data);
    return response.data;
  }

  @override
  Future get(String path, {Map<String, dynamic>? queryParameters}) async {
    final Response response =
        await dio.get(path, queryParameters: queryParameters);
    return response.data;
  }

  @override
  Future patch(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data}) async {
    final Response response =
        await dio.patch(path, queryParameters: queryParameters, data: data);
    return response.data;
  }

  @override
  Future post(String path,
      {Map<String, dynamic>? queryParameters, Object? data}) async {
    final Response response =
        await dio.post(path, queryParameters: queryParameters, data: data);
    return response.data;
  }

  @override
  Future put(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data}) async {
    final Response response = await dio.put(
      path,
      queryParameters: queryParameters,
      data: data,
    );
    return response.data;
  }
}
