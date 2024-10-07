import 'package:flutter/material.dart';

class AddNewCardButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddNewCardButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        backgroundColor: const Color(0xFFF1F1F1),
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      icon: const Icon(Icons.add_circle_outline, color: Color(0xFF28A745)),
      label: const Text(
        "Adicionar um novo cartão",
        style: TextStyle(
          color: Color(0xFF28A745),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
