import 'package:app2/src/models/enums/screen.dart';
import 'package:app2/src/modules/presentation/view/presentation_screen.dart';
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
      routes: ScreenRoute.routes,
    );
  }

}