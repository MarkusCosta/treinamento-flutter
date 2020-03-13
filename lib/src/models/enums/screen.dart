import 'package:app2/src/modules/login/bloc/login_bloc_provider.dart';
import 'package:app2/src/modules/login/view/login_screen.dart';
import 'package:app2/src/modules/presentation/view/presentation_screen.dart';
import 'package:app2/src/modules/ranking/view/ranking_screen.dart';
import 'package:flutter/material.dart';

enum Screen { login, presentation, ranking }

extension ScreenWidget on Screen {
  Widget get widget {
    switch (this) {
      case Screen.login:
        return LoginBlocProvider(child: LoginScreen());
      case Screen.presentation:
        return PresentationScreen();
      case Screen.ranking:
        return RankingScreen();
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
