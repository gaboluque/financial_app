import 'package:finance_app/widgets/transactions/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:finance_app/views/new_transaction_screen.dart';

class TransactionsListScreen extends StatelessWidget {
  const TransactionsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transactions')),
      body: const TransactionList(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const NewTransactionScreen(accountId: null)));
        },
      ),
    );
  }
}
