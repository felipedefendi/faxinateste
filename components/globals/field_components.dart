import 'package:flutter/material.dart';

class MyTextField extends TextFormField {
  MyTextField({
    super.inputFormatters,
    super.key,
    super.controller,
    super.onChanged,
    super.validator,
    super.obscureText,
    super.keyboardType,
    String hintText = "",
    String labelText = "",
    IconButton? sufixIcon,
  }) : super(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: hintText,
            labelText: labelText,
            suffixIcon: sufixIcon,
          ),
        );
}
