import 'package:flutter/material.dart';
import 'package:frontfaxina/app/components/profile/transaction_filter_component.dart';
import 'package:frontfaxina/app/components/profile/transaction_item_component.dart';
import 'package:frontfaxina/app/core/utils/mock/transaction_mock.dart';
import 'package:intl/intl.dart';

class FinanceHistoryView extends StatefulWidget {
  const FinanceHistoryView({super.key});

  @override
  _FinanceHistoryViewState createState() => _FinanceHistoryViewState();
}

class _FinanceHistoryViewState extends State<FinanceHistoryView> {
  late List<Map<String, String>> transactions;
  late List<bool> expandedList;
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;

  @override
  void initState() {
    super.initState();
    transactions = getTransactionMock();
    expandedList = List.filled(transactions.length, false);
    selectedStartDate = parseDate(transactions.first['date']);
    selectedEndDate = parseDate(transactions.last['date']);
  }

  void toggleExpand(int index) {
    setState(() {
      expandedList[index] = !expandedList[index];
    });
  }

  void _sortTransactions(bool isAscending) {
    setState(() {
      transactions.sort((a, b) {
        DateTime dateA = parseDate(a['date']);
        DateTime dateB = parseDate(b['date']);
        return isAscending ? dateA.compareTo(dateB) : dateB.compareTo(dateA);
      });
    });
  }

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: isStartDate ? selectedStartDate! : selectedEndDate!,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null &&
        pickedDate != (isStartDate ? selectedStartDate : selectedEndDate)) {
      setState(() {
        if (isStartDate) {
          selectedStartDate = pickedDate;
        } else {
          selectedEndDate = pickedDate;
        }
      });
    }
  }

  DateTime parseDate(String? date) {
    if (date == null) {
      return DateTime.now();
    }
    try {
      final DateFormat format = DateFormat('dd/MM/yyyy');
      return format.parse(date);
    } catch (e) {
      return DateTime.now();
    }
  }

  String formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredTransactions =
        transactions.where((transaction) {
      DateTime transactionDate = parseDate(transaction['date']);
      return transactionDate
              .isAfter(selectedStartDate!.subtract(const Duration(days: 1))) &&
          transactionDate
              .isBefore(selectedEndDate!.add(const Duration(days: 1)));
    }).toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF28A745)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text(
          "Histórico Financeiro",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF28A745),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => _selectDate(context, true),
                    child: Row(
                      children: [
                        const Text(
                          "Data Inicial:",
                          style: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          formatDate(selectedStartDate!),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () => _selectDate(context, false),
                    child: Row(
                      children: [
                        const Text(
                          "Data Final:",
                          style: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          formatDate(selectedEndDate!),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                TransactionFilterComponent(
                  onOrderChanged: _sortTransactions,
                ),
              ],
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Resultados Encontrados",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF28A745),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: filteredTransactions.length,
              itemBuilder: (context, index) {
                final transaction = filteredTransactions[index];
                return TransactionItemComponent(
                  transaction: transaction,
                  isExpanded: expandedList[index],
                  onTap: () => toggleExpand(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
