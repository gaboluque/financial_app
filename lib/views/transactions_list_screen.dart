import 'package:finance_app/controllers/account_controller.dart';
import 'package:finance_app/widgets/transactions/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:finance_app/views/new_transaction_screen.dart';

class TransactionsListScreen extends StatelessWidget {
  const TransactionsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final accountController = AccountController.of(context);
    final canShowAddButton = accountController.accounts.isNotEmpty;

    return Scaffold(
      appBar: AppBar(title: const Text('Transactions')),
      body: const TransactionList(),
      floatingActionButton: canShowAddButton
          ? FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const NewTransactionScreen(accountId: null)));
              },
            )
          : null,
    );
  }
}
