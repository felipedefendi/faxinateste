import 'package:flutter/material.dart';

class WalletBalanceComponent extends StatelessWidget {
  final double balance;

  const WalletBalanceComponent({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "Saldo:",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF28A745),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            "R\$ ${balance.toStringAsFixed(2)}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF28A745),
            ),
          ),
        ],
      ),
    );
  }
}
