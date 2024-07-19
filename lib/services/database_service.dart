import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  static Database? _database;

  factory DatabaseService() {
    return _instance;
  }

  DatabaseService._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'finance_app_dev.db');
    return await openDatabase(
      path,
      version: 1, // Increment version
      onCreate: _onCreate,
      // onUpgrade: _onUpgrade,
    );
  }

  Future _onCreate(Database db, int version) async {
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
