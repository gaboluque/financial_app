import 'package:finance_app/db/migrations/base_migration.dart';

class CreateFinancialTransactionsTable extends Migration {
  @override
  up(db) async {
    await db.execute('''
      CREATE TABLE financialTransactions (
      id TEXT PRIMARY KEY,
      accountId TEXT,
      description TEXT,
      amount REAL,
      currencyCode TEXT,
      transactionDate DATETIME,
      createdAt DATETIME,
      performedAt DATETIME,
      kind TEXT,
      notes TEXT,
      FOREIGN KEY (accountId) REFERENCES accounts (id)
      )
    ''');
  }
}
