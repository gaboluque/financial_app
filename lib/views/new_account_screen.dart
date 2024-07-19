import 'package:finance_app/widgets/accounts/account_form.dart';
import 'package:flutter/material.dart';
import 'package:finance_app/controllers/account_controller.dart';
import 'package:finance_app/models/account.dart';

class NewAccountScreen extends StatefulWidget {
  const NewAccountScreen({super.key});

  @override
  _NewAccountScreenState createState() => _NewAccountScreenState();
}

class _NewAccountScreenState extends State<NewAccountScreen> {
  final _formKey = GlobalKey<FormState>();

  Future<void> _saveAccount(Account account) async {
    await AccountController.of(context).addAccount(account);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Account')),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: AccountForm(
            key: _formKey,
            onSave: _saveAccount,
          )),
    );
  }
}
