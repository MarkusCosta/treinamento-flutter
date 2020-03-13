import 'package:app2/src/models/enums/async_process_state.dart';
import 'package:app2/src/models/enums/screen.dart';
import 'package:app2/src/models/extensions/navigator_screen.dart';
import 'package:app2/src/modules/login/bloc/login_bloc.dart';
import 'package:app2/src/modules/login/bloc/login_bloc_provider.dart';
import 'package:app2/src/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final scafoldKey = GlobalKey<ScaffoldState>();
    final loginBloc = LoginBlocProvider.of(context);

    loginBloc.loading.listen((event) {
      switch (event) {
        case AsyncProcessState.error:
          _showError(scafoldKey);
          break;

        case AsyncProcessState.completed:
          _navigateToRankingScreen(context);
          break;

        default:
          break;
      }
    });

    loginBloc.changeEmail('marcus.costa@redspark.io');
    loginBloc.changePassword('1234');

    return Scaffold(
      key: scafoldKey,
      appBar: AppBar(
        title: Text('Entrar'),
      ),
      body: Stack(
        children: <Widget>[
          _loginForm(loginBloc),
          _loader(loginBloc),
        ],
      ),
    );
  }

  Widget _loader(LoginBloc loginBloc) {
    return StreamBuilder(
      stream: loginBloc.loading,
      initialData: AsyncProcessState.none,
      builder: (context, snapshot) {
        Widget widget = Container();
        switch (snapshot.data) {
          case AsyncProcessState.loading:
            widget = Center(child: CircularProgressIndicator(),);
            break;
        }

        return widget;
      },
    );
  }

  _navigateToRankingScreen(BuildContext context) {
    NavigatorScreen.pushReplacement(context, Screen.ranking);
  }

  _showError(GlobalKey<ScaffoldState> scafoldKey) {
    final snackbar = SnackBar(content: Text('Erro ao efetuar login!'),);
    scafoldKey.currentState.showSnackBar(snackbar);
  }

  Widget _loginForm(LoginBloc loginBloc) {
    return Container(
      margin: EdgeInsets.only(left: 24, right: 24, top: 32),
      child: Column(
        children: <Widget>[
          _emailField(loginBloc),
          _passwordField(loginBloc),
          SizedBox(
            height: 24,
          ),
          _submitButton(loginBloc),
        ],
      ),
    );
  }

  Widget _emailField(LoginBloc loginBloc) {
    return StreamBuilder(
      stream: loginBloc.email,
      builder: (context, snapshot) {
        return TextFormField(
          onChanged: loginBloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email',
            hintText: 'you@provider.com',
            errorText: snapshot.error,
          ),
        );
      },
    );

  }

  Widget _passwordField(LoginBloc loginBloc) {
    return StreamBuilder(
      stream: loginBloc.password,
      builder: (context, snapshot) {
        return TextFormField(
          onChanged: loginBloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'asd@123',
              errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget _submitButton(LoginBloc loginBloc) {
    return StreamBuilder(
      stream: loginBloc.submitValid,
      builder: (context, snapshot) {
        print(snapshot);
        return PrimaryButton(
          'Entrar',
          snapshot.hasData ? loginBloc.submit : null,
        );
      },
    );
  }
}
