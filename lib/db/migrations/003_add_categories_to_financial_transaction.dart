import 'package:finance_app/db/migrations/base_migration.dart';

class AddCategoriesToFinancialTransaction extends Migration {
  @override
  up(db) async {
    await db.execute('''
      ALTER TABLE financialTransactions
      ADD COLUMN category TEXT NOT NULL DEFAULT 'Other'
    ''');

    await db.execute('''
      UPDATE financialTransactions
      SET category = 'Other'
    ''');
  }
}
