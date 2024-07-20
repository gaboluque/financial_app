import 'package:finance_app/models/transaction_category.dart';
import 'package:finance_app/widgets/forms/form_fields.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:finance_app/controllers/account_controller.dart';
import 'package:finance_app/models/financial_transaction.dart';
import 'package:provider/provider.dart';

class TransactionForm extends StatefulWidget {
  final String? accountId;
  final Function(FinancialTransaction) onSave;
  final FinancialTransaction? transaction;

  const TransactionForm(
      {super.key, this.accountId, required this.onSave, this.transaction});

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _formKey = GlobalKey<FormState>();
  String _description = '';
  double _amount = 0;
  final DateTime _transactionDate = DateTime.now();
  bool _performed = false;
  String _kind = 'expense';
  String _notes = '';
  String _accountId = '';
  String _category = 'Other';

  @override
  void initState() {
    super.initState();
    if (widget.accountId != null) {
      _accountId = widget.accountId!;
    } else {
      final accountController = AccountController.of(context);
      if (accountController.accounts.isNotEmpty) {
        setState(() {
          _accountId = accountController.accounts.first.id;
        });
      }
    }

    if (widget.transaction != null) {
      final transaction = widget.transaction!;
      _description = transaction.description;
      _amount = transaction.amount;
      _kind = transaction.kind;
      _notes = transaction.notes;
      _performed = transaction.performedAt != null;
      _category = transaction.category;
    }
  }

  void _saveTransaction() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final transaction = FinancialTransaction(
        id: widget.transaction?.id ?? Uuid().v4(),
        accountId: widget.accountId ?? _accountId,
        description: _description,
        amount: _amount,
        transactionDate: _transactionDate,
        createdAt: DateTime.now(),
        performedAt: _performed ? DateTime.now() : null,
        kind: _kind,
        notes: _notes,
        category: _category,
      );
      await widget.onSave(transaction);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          Consumer<AccountController>(
            builder: (context, accountController, child) {
              return FormFields.dropDown(
                label: "Account",
                value: _accountId,
                onChanged: (newValue) {
                  setState(() {
                    _accountId = newValue!;
                  });
                },
                itemMap: accountController.accountDropdownItems,
              );
            },
          ),
          FormFields.textField(
            label: 'Description',
            value: _description,
            onChanged: (value) => _description = value,
            validator: (value) =>
                value!.isEmpty ? 'Please enter a description' : null,
          ),
          FormFields.numberField(
            label: 'Amount',
            value: _amount.toString(),
            validator: (value) =>
                value!.isEmpty ? 'Please enter an amount' : null,
            onChanged: (value) => _amount = double.parse(value),
          ),
          FormFields.dropDown(
            label: "Kind",
            value: _kind,
            onChanged: (newValue) {
              _kind = newValue!;
            },
            items: FinancialTransaction.kinds(),
          ),
          FormFields.dropDown(
              value: _category,
              onChanged: (newValue) {
                _category = newValue!;
              },
              label: "Category",
              itemMap: TransactionCategory.getDropdownItems()),
          FormFields.textField(
            label: 'Notes',
            value: _notes,
            onChanged: (value) => {
              _notes = value,
            },
          ),
          FormFields.checkBox(
            label: 'Performed',
            value: _performed,
            onChanged: (value) {
              setState(() {
                _performed = value!;
              });
            },
          ),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: _saveTransaction,
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
