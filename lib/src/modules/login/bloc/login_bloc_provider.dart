import 'package:app2/src/modules/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';

class LoginBlocProvider extends InheritedWidget {
  final loginBloc = LoginBloc();

  LoginBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    final LoginBlocProvider provider =
        context.dependOnInheritedWidgetOfExactType();
    return provider.loginBloc;
  }
}
