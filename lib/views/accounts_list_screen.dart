import 'package:finance_app/widgets/layout/empty_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:finance_app/controllers/account_controller.dart';
import 'package:finance_app/views/new_account_screen.dart';
import 'package:finance_app/views/account_details_screen.dart';

class AccountsListScreen extends StatelessWidget {
  const AccountsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void addAccount() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NewAccountScreen()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Accounts')),
      body: Consumer<AccountController>(
        builder: (context, accountController, child) {
          if (accountController.accounts.isEmpty) {
            return EmptyState(
                message: "There are no accounts yet!",
                icon: Icons.savings,
                child: FilledButton.icon(
                    icon: const Icon(Icons.add),
                    onPressed: addAccount,
                    label: const Text('Add Account')));
          }

          return ListView.builder(
            itemCount: accountController.accounts.length + 1,
            itemBuilder: (context, index) {
              if (index == accountController.accounts.length) {
                // The last item is the "Add Account" button
                return ListTile(
                  title: Text('Add Account',
                      style: TextStyle(color: Theme.of(context).primaryColor)),
                  leading:
                      Icon(Icons.add, color: Theme.of(context).primaryColor),
                  onTap: addAccount,
                );
              } else {
                final account = accountController.accounts[index];
                return ListTile(
                  title: Text(account.name),
                  subtitle: Text(account.displayBalance),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AccountDetailsScreen(account: account),
                      ),
                    );
                  },
                );
              }
            },
          );
        },
      ),
    );
  }
}
