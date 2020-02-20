import 'package:app2/src/screens/login_screen.dart';
import 'package:app2/src/screens/presentation_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PresentationScreen(),
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.green[900],
      ),
      routes: {
        '/login': (_) => LoginScreen(),
      },
    );
  }

}