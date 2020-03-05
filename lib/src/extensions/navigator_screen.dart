import 'package:app2/src/enums/screen.dart';
import 'package:flutter/material.dart';

extension NavigatorScreen on Navigator {

  static Future pushReplacement(BuildContext context, Screen screen) {
    return Navigator.pushReplacementNamed(context, '$screen');
  }

}