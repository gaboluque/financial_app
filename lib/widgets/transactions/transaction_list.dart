import 'package:finance_app/controllers/financial_transaction_controller.dart';
import 'package:finance_app/models/transaction_category.dart';
import 'package:finance_app/utils/time_helper.dart';
import 'package:finance_app/views/transaction_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

class TransactionList extends StatelessWidget {
  final String? accountId;

  const TransactionList({super.key, this.accountId});

  @override
  Widget build(BuildContext context) {
    return Consumer<FinancialTransactionController>(
      builder: (context, transactionController, child) {
        var transactions = transactionController.transactions;

        if (accountId != null) {
          transactions = transactions
              .where((transaction) => transaction.accountId == accountId)
              .toList();
        } else {
          transactions = transactions.toList();
        }

        return ListView.builder(
          shrinkWrap: true,
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final transaction = transactions[index];
            return ListTile(
              title: Text(transaction.description),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${transaction.isIncome ? "+" : "-"} ${transaction.displayAmount}',
                    style: TextStyle(
                      color: transaction.isIncome ? Colors.green : Colors.red,
                    ),
                  ),
                  Icon(TransactionCategory.getIcon(transaction.category),
                      color:
                          TransactionCategory.getColor(transaction.category)),
                  Text(TimeHelper.formatDateTime(transaction.transactionDate),
                      style: const TextStyle(fontSize: 12)),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        TransactionDetailsScreen(transaction: transaction),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
