import 'package:finance_app/models/financial_transaction.dart';
import 'package:finance_app/services/database_service.dart';

class FinancialTransactionRepository {
  final DatabaseService _databaseService = DatabaseService();

  Future<void> insertTransaction(FinancialTransaction transaction) async {
    final db = await _databaseService.database;
    await db.insert('financialTransactions', transaction.toMap());
  }

  Future<List<FinancialTransaction>> getTransactions() async {
    final db = await _databaseService.database;
    final result =
        await db.query('financialTransactions', orderBy: 'performedAt DESC');
    var transactions =
        result.map((json) => FinancialTransaction.fromMap(json)).toList();

    return transactions;
  }

  Future<List<FinancialTransaction>> getTransactionsForAccount(
      String accountId) async {
    final db = await _databaseService.database;
    final result = await db.query(
      'financialTransactions',
      where: 'accountId = ?',
      whereArgs: [accountId],
    );
    return result.map((json) => FinancialTransaction.fromMap(json)).toList();
  }

  Future<void> updateTransaction(FinancialTransaction transaction) async {
    final db = await _databaseService.database;

    await db.update('financialTransactions', transaction.toMap(),
        where: 'id = ?', whereArgs: [transaction.id]);
  }

  Future<void> deleteTransaction(String id) async {
    final db = await _databaseService.database;
    await db.delete('financialTransactions', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteTransactionsByAccountId(String accountId) async {
    final db = await _databaseService.database;
    await db.delete('financialTransactions',
        where: 'accountId = ?', whereArgs: [accountId]);
  }

  Future<FinancialTransaction?> getTransactionById(String id) async {
    final db = await _databaseService.database;
    final result = await db
        .query('financialTransactions', where: 'id = ?', whereArgs: [id]);

    if (result.isEmpty) {
      return null;
    }
    return FinancialTransaction.fromMap(result.first);
  }
}
