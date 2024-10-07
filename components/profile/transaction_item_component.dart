import 'package:flutter/material.dart';

class TransactionItemComponent extends StatelessWidget {
  final Map<String, String> transaction;
  final bool isExpanded;
  final VoidCallback onTap;

  const TransactionItemComponent({
    super.key,
    required this.transaction,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final String date = transaction['date'] ?? 'Data não disponível';
    final String time = transaction['time'] ?? 'Hora não disponível';
    final String type = transaction['type'] ?? 'Tipo não disponível';
    final String id = transaction['id'] ?? 'ID não disponível';
    final String amount = transaction['amount'] ?? 'Valor não disponível';
    final String paymentMethod =
        transaction['paymentMethod'] ?? 'Método não disponível';
    final String category =
        transaction['category'] ?? 'Categoria não disponível';

    final bool isPositiveTransaction = amount.contains('+');
    final Color amountColor = isPositiveTransaction ? Colors.green : Colors.red;

    return Card(
      color: const Color(0xFFF5F5F5),
      child: Column(
        children: [
          ListTile(
            title: Row(
              children: [
                Text(
                  amount,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: amountColor,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '$type $id',
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            subtitle: Text('$date $time'),
            trailing: Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
            onTap: onTap,
          ),
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Data: $date'),
                  Text('Horário: $time'),
                  Row(
                    children: [
                      const Text(
                        'Valor: ',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        amount,
                        style: TextStyle(color: amountColor),
                      ),
                    ],
                  ),
                  Text('Categoria: $category'),
                  Text('Método de Pagamento: $paymentMethod'),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
