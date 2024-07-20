import 'package:finance_app/db/migrations/base_migration.dart';

class CreateAccountsTable extends Migration {
  @override
  up(db) async {
    await db.execute('''
      CREATE TABLE accounts (
        id TEXT PRIMARY KEY,
        name TEXT,
        currentBalance REAL,
        currencyCode TEXT,
        kind TEXT,
        accountNumber TEXT,
        createdAt TEXT
      )
    ''');
  }
}
