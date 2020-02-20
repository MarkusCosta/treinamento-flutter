import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {

  final String title;
  final Function callback;

  PrimaryButton(this.title, this.callback);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 44,
      margin: EdgeInsets.only(bottom: 64),
      child: RaisedButton(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        textColor: Colors.white,
        color: Colors.green[900],
        onPressed: callback,
      ),
    );
  }

}
