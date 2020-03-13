import 'package:app2/src/configs/http/auth_interceptor.dart';
import 'package:dio/dio.dart';

final HttpClient = _HttpClient().dio;

class _HttpClient {
  Dio dio;

  _HttpClient() {
    BaseOptions option = BaseOptions(
      baseUrl: 'http://10.0.2.2:8888/',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    dio = Dio(option)
      ..interceptors.add(AuthInterceptor())
      ..interceptors.add(LogInterceptor(requestBody: true));
  }
}
