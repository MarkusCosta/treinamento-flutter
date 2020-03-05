import 'package:app2/src/screens/login_screen.dart';
import 'package:app2/src/screens/presentation_screen.dart';
import 'package:flutter/material.dart';

enum Screen { login, presentation }

extension ScreenWidget on Screen {
  Widget get widget {
    switch (this) {
      case Screen.login:
        return LoginScreen();
      case Screen.presentation:
        return PresentationScreen();
      default:
        return null;
    }
  }
}

extension ScreenRoute on Screen {
  static Map<String, Widget Function(BuildContext)> get routes =>
      Map.fromIterable(
        Screen.values,
        key: (element) => '$element',
        value: (element) => (_) => (element as Screen).widget,
      );
}
