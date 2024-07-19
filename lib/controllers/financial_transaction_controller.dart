import 'package:finance_app/models/financial_transaction.dart';
import 'package:finance_app/repositories/financial_transaction_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FinancialTransactionController with ChangeNotifier {
  final FinancialTransactionRepository _transactionRepository =
      FinancialTransactionRepository();
  List<FinancialTransaction> _transactions = [];

  List<FinancialTransaction> get transactions => _transactions;

  FinancialTransactionController() {
    fetchTransactions();
  }

  static FinancialTransactionController of(BuildContext context) {
    return Provider.of<FinancialTransactionController>(context, listen: false);
  }

  Future<void> fetchTransactions() async {
    _transactions = await _transactionRepository.getTransactions();
    notifyListeners();
  }

  Future<void> addTransaction(FinancialTransaction transaction) async {
    await _transactionRepository.insertTransaction(transaction);
    await fetchTransactions();
  }

  Future<void> updateTransaction(FinancialTransaction transaction) async {
    await _transactionRepository.updateTransaction(transaction);
    await fetchTransactions();
  }

  Future<void> deleteTransaction(String id) async {
    await _transactionRepository.deleteTransaction(id);
    await fetchTransactions();
  }

  Future<void> deleteTransactionsByAccountId(String accountId) async {
    await _transactionRepository.deleteTransactionsByAccountId(accountId);
    await fetchTransactions();
  }
}
