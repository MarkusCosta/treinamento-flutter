import 'package:app2/src/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class PresentationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _backgroundDecoration(),
      child: Column(
        children: <Widget>[
          _presentationLogo(),
          _emptyExpandableSpace(),
          PrimaryButton('PLAY', () => Navigator.pushReplacementNamed(context, '/login')),
        ],
      ),
    );
  }

  BoxDecoration _backgroundDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.green[900],
          Colors.green[600],
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }

  Widget _emptyExpandableSpace() {
    return Expanded(
      child: Container(color: Colors.transparent,),
    );
  }

  Widget _presentationLogo() {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(top: 128),
      child: Container(
        padding:
        EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          border: Border.all(
            color: Colors.black,
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
        child: Text(
          'BLACKJACK',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontStyle: FontStyle.italic,
            fontSize: 44,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }

}
