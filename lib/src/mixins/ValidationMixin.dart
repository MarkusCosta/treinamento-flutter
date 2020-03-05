mixin ValidationMixin {

  String validateEmail(String email) => email.contains('@') ? null : 'Insira um email valido';

  String validatePassword(String password) => password.length > 3 ? null : 'Insira um password valido';

}