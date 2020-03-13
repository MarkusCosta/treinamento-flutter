import 'package:app2/src/models/dtos/user.dart';
import 'package:app2/src/configs/http/http_client.dart';

class UserHttpProvider {

  const UserHttpProvider();

  Future<User> getUser() {
    return HttpClient.get('me')
        .then((response) => User.fromJson(response.data));
  }

}