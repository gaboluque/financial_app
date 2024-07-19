import 'package:finance_app/widgets/layout/alerts.dart';
import 'package:finance_app/widgets/transactions/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:finance_app/controllers/account_controller.dart';
import 'package:finance_app/models/account.dart';
import 'package:finance_app/views/new_transaction_screen.dart';

class AccountDetailsScreen extends StatefulWidget {
  final Account account;

  const AccountDetailsScreen({super.key, required this.account});

  @override
  _AccountDetailsScreenState createState() => _AccountDetailsScreenState();
}

class _AccountDetailsScreenState extends State<AccountDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final accountController = AccountController.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              Alerts.confirmDialog(
                context: context,
                title: 'Delete Account',
                content: 'Are you sure you want to delete this account?',
                confirmText: "Delete",
                onConfirm: () async {
                  await accountController.deleteAccount(widget.account.id);
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Account Details
            Consumer<AccountController>(
              builder: (context, accountController, child) {
                final account = accountController.accounts
                    .firstWhere((account) => account.id == widget.account.id);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Account Details
                    const Text('Account Details',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text('Name: ${account.name}'),
                    const SizedBox(height: 10),
                    Text('Current Balance: ${account.displayBalance}'),
                    const SizedBox(height: 20),
                  ],
                );
              },
            ),
            // Transactions
            const SizedBox(height: 10),
            // Title with Add Transaction Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Transactions',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NewTransactionScreen(accountId: widget.account.id),
                      ),
                    );
                  },
                  child: const Text('+'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Expanded Transaction List
            Expanded(
              child: TransactionList(accountId: widget.account.id),
            ),
          ],
        ),
      ),
    );
  }
}
