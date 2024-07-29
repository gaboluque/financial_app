import 'package:finance_app/widgets/forms/form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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
  final _formKey = GlobalKey<FormBuilderState>();
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
        name: _formKey.currentState!.fields['name']!.value as String,
        currentBalance: double.parse(
            _formKey.currentState!.fields['currentBalance']!.value),
        kind: _formKey.currentState!.fields['kind']!.value as String,
        accountNumber:
            _formKey.currentState!.fields['accountNumber']!.value as String,
        createdAt: widget.account?.createdAt ?? DateTime.now(),
      );
      widget.onSave(account);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: ListView(
        children: [
          FormFields.textField(
              name: 'name',
              label: 'Name',
              validator: (value) =>
                  value!.isEmpty ? 'Please enter a name' : null,
              initialValue: _name),
          FormFields.numberField(
            name: 'currentBalance',
            label: 'Current Balance',
            validator: (value) =>
                value!.isEmpty ? 'Please enter a balance' : null,
            initialValue: _currentBalance.toString(),
          ),
          FormFields.dropDown(
            name: 'kind',
            items: Account.kinds(),
            label: 'Kind',
            initialValue: _kind,
          ),
          FormFields.textField(
              name: 'accountNumber',
              label: 'Account Number',
              initialValue: _accountNumber),
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
