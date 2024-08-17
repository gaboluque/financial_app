import 'package:finance_app/db/migrations/001_create_accounts_table.dart';
import 'package:finance_app/db/migrations/002_create_financial_transactions_table.dart';
import 'package:finance_app/db/migrations/003_add_categories_to_financial_transaction.dart';
import 'package:finance_app/db/migrations/base_migration.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbInit {
  final List<Migration> migrations = [
    CreateAccountsTable(),
    CreateFinancialTransactionsTable(),
    AddCategoriesToFinancialTransaction(),
  ];

  final String _dbName = 'financial_tracker_.db';

  Future<Database> init() async {
    String path = join(await getDatabasesPath(), _dbName);
    return await openDatabase(
      path,
      version: migrations.length,
      onUpgrade: _onUpgrade,
    );
  }

  Future _onUpgrade(Database db, int oldVersion, int version) async {
    for (var migration in migrations) {
      if (migrations.indexOf(migration) >= oldVersion) {
        await migration.up(db);
      }
    }
  }
}
