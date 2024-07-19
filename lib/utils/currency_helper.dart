import 'package:intl/intl.dart';

class CurrencyHelper {
  static String formatCurrency(double amount) {
    var f = NumberFormat.currency(locale: 'en_US', symbol: '\$');
    return f.format(amount);
  }
}
