import 'package:finance_app/models/financial_transaction.dart';
import 'package:finance_app/widgets/forms/form_fields.dart';
import 'package:finance_app/models/account.dart';
import 'package:finance_app/repositories/account_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountController with ChangeNotifier {
  final AccountRepository _accountRepository = AccountRepository();
  List<Account> _accounts = [];

  List<Account> get accounts => _accounts;
  List<DropdownItemMap> get accountDropdownItems => _accounts
      .map((account) => DropdownItemMap(value: account.id, label: account.name))
      .toList();

  AccountController() {
    fetchAccounts();
  }

  static AccountController of(BuildContext context) {
    return Provider.of<AccountController>(context, listen: false);
  }

  Future<void> fetchAccounts() async {
    _accounts = await _accountRepository.getAccounts();
    notifyListeners();
  }

  Future<void> addAccount(Account account) async {
    await _accountRepository.insertAccount(account);
    await fetchAccounts();
  }

  Future<void> updateAccount(Account account) async {
    await _accountRepository.updateAccount(account);
    await fetchAccounts();
  }

  Future<void> deleteAccount(String id) async {
    await _accountRepository.deleteAccount(id);
    await fetchAccounts();
  }

  Future<void> updateAccountBalance(FinancialTransaction transaction) async {
    final account =
        _accounts.firstWhere((account) => account.id == transaction.accountId);
    if (transaction.kind == FinancialTransaction.EXPENSE) {
      account.currentBalance -= transaction.amount;
    } else {
      account.currentBalance += transaction.amount;
    }

    await updateAccount(account);
    await fetchAccounts();
  }

  Future<void> revertTransaction(FinancialTransaction transaction) async {
    final account =
        _accounts.firstWhere((account) => account.id == transaction.accountId);

    if (transaction.kind == FinancialTransaction.EXPENSE) {
      account.currentBalance += transaction.amount;
    } else {
      account.currentBalance -= transaction.amount;
    }

    await updateAccount(account);
    await fetchAccounts();
  }
}
