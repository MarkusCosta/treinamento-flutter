import 'package:app2/src/models/dtos/login_form.dart';
import 'package:app2/src/configs/http/http_client.dart';

class AuthHttpProvider {

  const AuthHttpProvider();

  Future<String> getToken(LoginForm loginForm) {
    return HttpClient.post('auth', data: loginForm.toJson())
    .then((response) => response.headers.value('Authorization'));
  }

}