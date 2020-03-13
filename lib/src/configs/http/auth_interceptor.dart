import 'package:app2/src/providers/cache/secure_cache_provider.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {

  final SecureCacheProvider secureCacheProvider;

  AuthInterceptor({this.secureCacheProvider = const SecureCacheProvider()});

  @override
  Future onRequest(RequestOptions options) async {
    options.headers['Authorization'] = await secureCacheProvider.token;
    return super.onRequest(options);
  }
}