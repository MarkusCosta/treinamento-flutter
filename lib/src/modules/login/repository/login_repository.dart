import 'package:app2/src/providers/cache/secure_cache_provider.dart';
import 'package:app2/src/providers/database/user_database_provider.dart';
import 'package:app2/src/models/dtos/login_form.dart';
import 'package:app2/src/models/dtos/user.dart';
import 'package:app2/src/providers/http/auth_http_provider.dart';
import 'package:app2/src/providers/http/user_http_provider.dart';

class LoginRepository {
  final AuthHttpProvider authHttpProvider;
  final UserHttpProvider userHttpProvider;
  final SecureCacheProvider secureCacheProvider;
  final UserDatabaseProvider userDatabaseProvider;

  LoginRepository({
    this.authHttpProvider = const AuthHttpProvider(),
    this.userHttpProvider = const UserHttpProvider(),
    this.secureCacheProvider = const SecureCacheProvider(),
    this.userDatabaseProvider = const UserDatabaseProvider(),
  });

  Future<User> performLogin(LoginForm loginForm) async {
    return authHttpProvider.getToken(loginForm)
      .then((token) => secureCacheProvider.token = token)
      .then((_) => userHttpProvider.getUser())
      .then((user) => userDatabaseProvider.saveOrUpdateUser(user));
  }

}