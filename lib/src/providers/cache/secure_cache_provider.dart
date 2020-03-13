import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureCacheProvider {

  final storage = const FlutterSecureStorage();

  final _tokenKey = 'http.token.key';

  const SecureCacheProvider();

  get token async {
    return await storage.read(key: _tokenKey);
  }

  set token(String value) {
    storage.write(key: _tokenKey, value: value);
  }

}