import 'package:app2/src/modules/login/bloc/login_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Email validator', () {
    test('When send a valid email validator emits email', () {
      // Arrange
      final bloc = LoginBloc();
      final validEmail = 'marcus.costa@redspark.io';

      // Assert
      expectLater(bloc.email, emits(validEmail));

      // Action
      bloc.changeEmail(validEmail);
    });

    test('When send a invalid email validator emits error', () {
      // Arrange
      final bloc = LoginBloc();
      final invalidEmail = 'marcus';

      // Assert
      expectLater(bloc.email, emitsError('Insira um email valido'));

      // Action
      bloc.changeEmail(invalidEmail);
    });
  });
}
