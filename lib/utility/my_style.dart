import 'package:flutter/material.dart';

class MyStyle {
  double h1 = 30.0, h2 = 18.0;
  Color textColor = Colors.red[400];
  Color mainColor = Colors.blue[200];
  String nameFont = 'Pattaya';
  String nameApp = 'pakk';

  EdgeInsetsGeometry myPadding = EdgeInsets.all(20.0);

  TextStyle myWhiteTextStyle = TextStyle(color: Colors.white);
  TextStyle myTextStyleH2 = TextStyle(
    color: Colors.deepOrange[400],
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );

  ShapeBorder curveButton =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0));

  MyStyle();
}
