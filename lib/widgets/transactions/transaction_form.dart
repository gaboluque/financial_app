import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:finance_app/models/financial_transaction.dart';
import 'package:finance_app/models/transaction_category.dart';
import 'package:finance_app/widgets/forms/form_fields.dart';
import 'package:finance_app/widgets/layout/snackbars.dart';
import 'package:finance_app/controllers/account_controller.dart';
import 'package:finance_app/services/receipt_processor.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class TransactionForm extends StatefulWidget {
  final String? accountId;
  final Function(FinancialTransaction) onSave;
  final FinancialTransaction? transaction;

  const TransactionForm({
    super.key,
    this.accountId,
    required this.onSave,
    this.transaction,
  });

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  final ReceiptProcessor _receiptProcessor = ReceiptProcessor();

  File? _receiptImage;
  bool _isProcessing = false;

  Future<void> _pickImage() async {
    try {
      final pickedImage = await _receiptProcessor.pickImage();
      setState(() {
        _receiptImage = pickedImage;
      });

      _processReceipt();
    } catch (e) {
      Snackbars.error(context, 'Failed to pick image: $e');
    }
  }

  Future<void> _processReceipt() async {
    if (_receiptImage == null || _isProcessing) return;

    setProcessing(true);

    try {
      Snackbars.info(context, 'Processing receipt, this might take a while...');
      final extractedData =
          await _receiptProcessor.processReceipt(_receiptImage!);
      _updateFormWithExtractedData(extractedData);
    } catch (e) {
      print(e);
      Snackbars.error(context, 'Failed to process receipt: $e');
    } finally {
      setProcessing(false);
    }
  }

  void setProcessing(bool processing) {
    setState(() {
      _isProcessing = processing;
    });
  }

  void _updateFormWithExtractedData(Map<String, dynamic> data) {
    _formKey.currentState?.patchValue({
      'description': data['description'],
      'amount': data['amount'].toString(),
      'category': data['category'],
      'notes': data['notes'],
    });

    _formKey.currentState?.saveAndValidate();
  }

  void _saveTransaction() {
    if (!_formKey.currentState!.saveAndValidate()) {
      Snackbars.error(context, 'Please fix the errors in the form');
    }

    final formData = _formKey.currentState!.value;
    final transaction = FinancialTransaction(
      id: widget.transaction?.id ?? const Uuid().v4(),
      accountId: formData['account'],
      description: formData['description'],
      amount: double.parse(formData['amount']),
      createdAt: widget.transaction?.createdAt ?? DateTime.now(),
      performedAt: formData['performedAt'] ?? DateTime.now(),
      kind: formData['kind'],
      notes: formData['notes'] ?? "",
      category: formData['category'],
    );
    widget.onSave(transaction);
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: ListView(
        children: [
          Consumer<AccountController>(
            builder: (context, accountController, child) {
              return FormFields.dropDown(
                  name: 'account',
                  label: "Account",
                  initialValue: widget.accountId ??
                      accountController.accounts.firstOrNull?.id,
                  itemMap: accountController.accountDropdownItems,
                  validator: (value) {
                    if (value == null) return 'Please select an account';
                    return null;
                  });
            },
          ),
          Column(
            children: [
              const SizedBox(height: 10),
              FormFields.textField(
                name: 'description',
                label: 'Description',
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter a description'
                    : null,
                initialValue: widget.transaction?.description,
              ),
              const SizedBox(height: 10),
              FormFields.numberField(
                name: 'amount',
                label: 'Amount',
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter an amount'
                    : null,
                initialValue: widget.transaction?.amount.toString(),
              ),
              const SizedBox(height: 10),
              FormFields.dropDown(
                name: 'kind',
                label: "Kind",
                initialValue:
                    widget.transaction?.kind ?? FinancialTransaction.EXPENSE,
                items: FinancialTransaction.kinds(),
              ),
              const SizedBox(height: 10),
              FormFields.dropDown(
                name: 'category',
                label: "Category",
                initialValue: widget.transaction?.category ??
                    TransactionCategory.defaultCategory,
                itemMap: TransactionCategory.getDropdownItems(),
              ),
              const SizedBox(height: 10),
              FormFields.datePicker(
                name: 'performedAt',
                label: 'Transaction Date',
                initialValue: widget.transaction?.performedAt ?? DateTime.now(),
              ),
              const SizedBox(height: 10),
              FormFields.textArea(
                name: 'notes',
                label: 'Notes',
                initialValue: widget.transaction?.notes,
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(height: 20),
              ElevatedButton.icon(
                icon: const Icon(Icons.perm_media),
                onPressed: _pickImage,
                label: _isProcessing
                    ? const Text('Processing Receipt...')
                    : const Text('Pick Receipt Image'),
              ),
              if (_receiptImage != null)
                Image.file(_receiptImage!, height: 50, width: 50),
            ],
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
