import 'package:finance_app/models/account.dart';
import 'package:finance_app/models/financial_transaction.dart';
import 'package:finance_app/services/database_service.dart';

class AccountRepository {
  final DatabaseService _databaseService = DatabaseService();

  Future<void> insertAccount(Account account) async {
    final db = await _databaseService.database;
    await db.insert('accounts', account.toMap());
  }

  Future<List<Account>> getAccounts() async {
    final db = await _databaseService.database;
    final result = await db.query('accounts');
    return result.map((json) => Account.fromMap(json)).toList();
  }

  Future<Account> getAccount(String id) async {
    final db = await _databaseService.database;
    final result = await db.query('accounts', where: 'id = ?', whereArgs: [id]);
    return Account.fromMap(result.first);
  }

  Future<void> updateAccount(Account account) async {
    final db = await _databaseService.database;

    await db.update('accounts', account.toMap(),
        where: 'id = ?', whereArgs: [account.id]);
  }

  Future<void> deleteAccount(String id) async {
    final db = await _databaseService.database;
    await db.delete('accounts', where: 'id = ?', whereArgs: [id]);
    await db.delete('transactions', where: 'account_id = ?', whereArgs: [id]);
  }

  Future<void> updateAccountBalance(
      String accountId, FinancialTransaction transaction) async {
    final account = await getAccount(accountId);

    account.currentBalance = transaction.kind == FinancialTransaction.INCOME
        ? account.currentBalance + transaction.amount
        : account.currentBalance - transaction.amount;

    await updateAccount(account);
  }
}
