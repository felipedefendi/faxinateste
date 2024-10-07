import 'package:flutter/material.dart';

class MyCustomIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Icon icon;
  final Color borderColor;
  final double borderRadius;
  final EdgeInsets padding;
  final double size;

  const MyCustomIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.borderColor = const Color(0xFF00AC47),
    this.borderRadius = 15.0,
    this.padding = const EdgeInsets.all(8.0),
    this.size = 48.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0x83C7C7C7)),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(9, 0, 0, 0),
        child: Center(
          child: IconButton(
            onPressed: onPressed,
            icon: icon,
            color: const Color(0xFF00AC47),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ),
      ),
    );
  }
}
