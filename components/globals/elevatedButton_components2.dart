import 'package:flutter/material.dart';

class MyElevatedButton2 extends ElevatedButton {
  final Color backgroundColor;

  MyElevatedButton2({
    super.key,
    required VoidCallback super.onPressed,
    required Widget child,
    this.backgroundColor = const Color.fromRGBO(0, 172, 71, 1),
  }) : super(
          child: Column(
            children: [
              SizedBox(
                height: 100,
                width: 95,
                child: Center(child: child),
              ),
            ],
          ),
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(backgroundColor),
            foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
            shape: WidgetStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            textStyle: WidgetStateProperty.all<TextStyle>(
              const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
}
