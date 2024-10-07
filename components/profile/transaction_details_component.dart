import 'package:flutter/material.dart';

class TransactionDetailsComponent extends StatelessWidget {
  final Map<String, String> transaction;

  const TransactionDetailsComponent({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Data: ${transaction['date']}"),
          Text("Horário: ${transaction['time']}"),
          Text("Valor: ${transaction['amount']}"),
          Text("Categoria: ${transaction['category']}"),
          Text("Método de Pagamento: ${transaction['paymentMethod']}"),
          const Divider(),
        ],
      ),
    );
  }
}
