import 'package:flutter/material.dart';

class TransactionFilterComponent extends StatefulWidget {
  final Function(bool) onOrderChanged;

  const TransactionFilterComponent({super.key, required this.onOrderChanged});

  @override
  _TransactionFilterComponentState createState() =>
      _TransactionFilterComponentState();
}

class _TransactionFilterComponentState
    extends State<TransactionFilterComponent> {
  bool isAscending = true;

  void _toggleOrder() {
    setState(() {
      isAscending = !isAscending;
      widget.onOrderChanged(isAscending);
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isAscending ? Icons.arrow_upward : Icons.arrow_downward,
        color: Colors.black,
      ),
      onPressed: _toggleOrder,
    );
  }
}
