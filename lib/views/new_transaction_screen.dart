import 'package:finance_app/controllers/account_controller.dart';
import 'package:finance_app/widgets/transactions/transaction_form.dart';
import 'package:flutter/material.dart';
import 'package:finance_app/controllers/financial_transaction_controller.dart';

class NewTransactionScreen extends StatelessWidget {
  final String? accountId;

  const NewTransactionScreen({super.key, this.accountId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Transaction')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TransactionForm(
          accountId: accountId,
          onSave: (transaction) {
            FinancialTransactionController.of(context)
                .addTransaction(transaction);
            AccountController.of(context).updateAccountBalance(transaction);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
