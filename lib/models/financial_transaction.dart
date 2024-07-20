import 'package:finance_app/models/transaction_category.dart';
import 'package:finance_app/utils/currency_helper.dart';

class FinancialTransaction {
  final String id;
  final String accountId;
  final String description;
  final double amount;
  final DateTime transactionDate;
  final DateTime createdAt;
  final DateTime? performedAt;
  final String kind;
  final String notes;
  final String category;

  FinancialTransaction({
    required this.id,
    required this.accountId,
    required this.description,
    required this.amount,
    required this.transactionDate,
    required this.createdAt,
    this.performedAt,
    required this.kind,
    required this.notes,
    this.category = 'Other',
  });

  static const String INCOME = 'income';
  static const String EXPENSE = 'expense';
  static kinds() => [INCOME, EXPENSE];

  static categories() => TransactionCategory.categories;

  get isIncome => kind == INCOME;
  get isExpense => kind == EXPENSE;

  String get displayAmount {
    return CurrencyHelper.formatCurrency(amount);
  }

  factory FinancialTransaction.fromMap(Map<String, dynamic> json) =>
      FinancialTransaction(
        id: json['id'],
        accountId: json['accountId'],
        description: json['description'],
        amount: json['amount'],
        transactionDate: DateTime.parse(json['transactionDate']),
        createdAt: DateTime.parse(json['createdAt']),
        performedAt: json['performedAt'] != null
            ? DateTime.parse(json['performedAt'])
            : null,
        kind: json['kind'],
        notes: json['notes'],
        category: json['category'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'accountId': accountId,
        'description': description,
        'amount': amount,
        'transactionDate': transactionDate.toIso8601String(),
        'createdAt': createdAt.toIso8601String(),
        'performedAt': performedAt?.toIso8601String(),
        'kind': kind,
        'notes': notes,
        'category': category,
      };
}
