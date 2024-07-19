import 'package:finance_app/controllers/account_controller.dart';
import 'package:finance_app/widgets/layout/alerts.dart';
import 'package:finance_app/widgets/transactions/transaction_form.dart';
import 'package:flutter/material.dart';
import 'package:finance_app/controllers/financial_transaction_controller.dart';
import 'package:finance_app/models/financial_transaction.dart';

class TransactionDetailsScreen extends StatelessWidget {
  final FinancialTransaction transaction;

  const TransactionDetailsScreen({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    void saveChanges(FinancialTransaction updatedTransaction) async {
      FinancialTransactionController.of(context)
          .updateTransaction(updatedTransaction);
      AccountController.of(context).revertTransaction(transaction);
      AccountController.of(context).updateAccountBalance(updatedTransaction);
      Navigator.pop(context);
    }

    void deleteTransaction() {
      FinancialTransactionController.of(context)
          .deleteTransaction(transaction.id);
      AccountController.of(context).revertTransaction(transaction);
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(title: Text(transaction.description), actions: [
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            Alerts.confirmDialog(
              context: context,
              title: 'Delete transaction',
              content: 'Are you sure you want to delete this transaction?',
              confirmText: "Delete",
              onConfirm: deleteTransaction,
            );
          },
        ),
      ]),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TransactionForm(
            transaction: transaction,
            accountId: transaction.accountId,
            onSave: saveChanges,
          )),
    );
  }
}
