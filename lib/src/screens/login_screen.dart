import 'package:app2/src/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entrar'),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 24, right: 24, top: 32),
        child: Column(
          children: <Widget>[
            _emailField(),
            _passwordField(),
            SizedBox(
              height: 24,
            ),
            _submitButton(),
          ],
        ),
      ),
    );
  }

  Widget _emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'you@provider.com',
        errorText: null,
      ),
      onChanged: (value) => email = value,
    );
  }

  Widget _passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'asd@123',
        errorText: null,
      ),
      onChanged: (value) => password = value,
    );
  }

  Widget _submitButton() {
    return PrimaryButton('Submit 2', () {
      var isValid = true;
      if (!email.contains('@')) {
        isValid = false;
        //PINTAR
        // Setar msg erro

      }

      if (password.length < 4) {
        isValid = false;
      }

      if (isValid) {
        print('isValid: $isValid');
        // TODO - enviar dados
      }
    });
  }
}
