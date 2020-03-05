import 'package:app2/src/mixins/ValidationMixin.dart';
import 'package:app2/src/models/LoginForm.dart';
import 'package:app2/src/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget  with ValidationMixin {

  final formKey = GlobalKey<FormState>();
  final loginForm = LoginForm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entrar'),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 24, right: 24, top: 32),
        child: Form(
          key: formKey,
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
      ),
    );
  }

  Widget _emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'you@provider.com',
      ),
      validator: validateEmail,
      onSaved: (value) => loginForm.email = value,
    );
  }

  Widget _passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'asd@123',
      ),
      validator: validatePassword,
      onSaved: (value) => loginForm.password = value,
    );
  }

  Widget _submitButton() {
    return PrimaryButton('Entrar', () {
      if (formKey.currentState.validate()) {
        formKey.currentState.save();
        print(loginForm);
        // TODO - enviar dados
      }
    });
  }
}
