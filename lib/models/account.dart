import 'package:finance_app/utils/currency_helper.dart';

class Account {
  final String id;
  final String name;
  double currentBalance;
  final String kind;
  final String accountNumber;
  final DateTime createdAt;

  Account({
    required this.id,
    required this.name,
    required this.currentBalance,
    required this.kind,
    required this.accountNumber,
    required this.createdAt,
  });

  static kinds() => ['Savings', 'Credit Card', 'Checking'];

  String get displayBalance {
    return CurrencyHelper.formatCurrency(currentBalance);
  }

  factory Account.fromMap(Map<String, dynamic> json) => Account(
        id: json["id"],
        name: json["name"],
        currentBalance: json["currentBalance"],
        kind: json["kind"],
        accountNumber: json["accountNumber"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "currentBalance": currentBalance,
        "kind": kind,
        "accountNumber": accountNumber,
        "createdAt": createdAt.toIso8601String(),
      };
}
