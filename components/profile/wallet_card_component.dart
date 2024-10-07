import 'package:flutter/material.dart';

class WalletCardComponent extends StatelessWidget {
  final Map<String, String> card;
  final VoidCallback onEditPressed;
  final VoidCallback onDeletePressed;

  const WalletCardComponent({
    super.key,
    required this.card,
    required this.onEditPressed,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              card['type']!,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.grey),
            onPressed: onEditPressed, 
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.grey),
            onPressed: onDeletePressed, 
          ),
        ],
      ),
    );
  }
}
