import 'package:finance_app/widgets/forms/form_fields.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:finance_app/models/account.dart';

class AccountForm extends StatefulWidget {
  const AccountForm({super.key, this.account, required this.onSave});

  final Account? account;
  final Future<void> Function(Account) onSave;

  @override
  _AccountFormState createState() => _AccountFormState();
}

class _AccountFormState extends State<AccountForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  double _currentBalance = 0.0;
  String _kind = Account.kinds().first;
  String _accountNumber = '';

  @override
  void initState() {
    super.initState();
    _name = widget.account?.name ?? '';
    _currentBalance = widget.account?.currentBalance ?? 0.0;
    _kind = widget.account?.kind ?? Account.kinds().first;
    _accountNumber = widget.account?.accountNumber ?? '';
  }

  void _saveAccount() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final account = Account(
        id: widget.account?.id ?? const Uuid().v4(),
        name: _name,
        currentBalance: _currentBalance,
        kind: _kind,
        accountNumber: _accountNumber,
        createdAt: widget.account?.createdAt ?? DateTime.now(),
      );
      widget.onSave(account);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          FormFields.textField(
            label: 'Name',
            onChanged: (value) => _name = value,
            validator: (value) => value!.isEmpty ? 'Please enter a name' : null,
          ),
          FormFields.numberField(
            label: 'Current Balance',
            validator: (value) =>
                value!.isEmpty ? 'Please enter a balance' : null,
            onChanged: (value) => _currentBalance = double.parse(value),
          ),
          FormFields.dropDown(
            value: _kind,
            onChanged: (newValue) {
              _kind = newValue!;
            },
            items: Account.kinds(),
            label: 'Kind',
          ),
          FormFields.textField(
            label: 'Account Number',
            onChanged: (value) => _accountNumber = value,
          ),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: _saveAccount,
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
