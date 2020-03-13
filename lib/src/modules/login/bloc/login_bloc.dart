import 'dart:async';

import 'package:app2/src/models/enums/async_process_state.dart';
import 'package:app2/src/models/mixins/ValidationMixin.dart';
import 'package:app2/src/modules/login/repository/login_repository.dart';
import 'package:app2/src/models/dtos/login_form.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with ValidationMixin {
  final _loginRepository = LoginRepository();

  final _emailSubject = BehaviorSubject<String>();
  final _passwordSubject = BehaviorSubject<String>();
  final _processSubject = BehaviorSubject<AsyncProcessState>();

  Stream<String> get email =>
      _emailSubject.stream.transform(validateEmailStream);
  Stream<String> get password =>
      _passwordSubject.stream.transform(validatePasswordStream);
  Stream<AsyncProcessState> get loading => _processSubject.stream;

  Stream<bool> get submitValid =>
      Rx.combineLatest2(email, password, (e, p) => true);

  Function(String) get changeEmail => _emailSubject.sink.add;
  Function(String) get changePassword => _passwordSubject.sink.add;
  Function(AsyncProcessState) get _changeLoadingState => _processSubject.sink.add;

  submit() async {
    _changeLoadingState(AsyncProcessState.loading);

    final loginForm = LoginForm()
      ..email = _emailSubject.value.trim()
      ..password = _passwordSubject.value.trim();

    try {
      await _loginRepository.performLogin(loginForm);
      _changeLoadingState(AsyncProcessState.completed);
    } catch (error) {
      _changeLoadingState(AsyncProcessState.error);
    }

  }

  dispose() {
    _emailSubject.close();
    _passwordSubject.close();
    _processSubject.close();
  }

}
