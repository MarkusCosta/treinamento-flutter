import 'dart:async';

mixin ValidationMixin {

  String validateEmail(String email) => email.contains('@') ? null : 'Insira um email valido';

  String validatePassword(String password) => password.length > 3 ? null : 'Insira um password valido';

  StreamTransformer<String, String> get validateEmailStream => _validatorStream(validateEmail);

  StreamTransformer<String, String> get validatePasswordStream => _validatorStream(validatePassword);

  StreamTransformer<String, String> _validatorStream(
      String Function(String) validateFunction) {
    return StreamTransformer<String, String>.fromHandlers(
        handleData: (value, sink) {
          final errorMessage = validateFunction(value);
          if (errorMessage == null) {
            sink.add(value);
          } else {
            sink.addError(errorMessage);
          }
        });
  }

}