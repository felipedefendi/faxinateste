import 'package:flutter/material.dart';

class MyCustomText extends Text {
  MyCustomText(
    super.data, {
    super.key,
    Color color = const Color(0xFF00AC47),
    double fontSize = 32,
    FontWeight fontWeight = FontWeight.bold,
    super.textAlign,
    // ignore: non_constant_identifier_names
    Font,
  }) : super(
            style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ));
}
