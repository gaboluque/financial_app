class TimeHelper {
  static String formatDateTime(DateTime dateTime,
      [String format = 'dd/mm/yyyy']) {
    switch (format.toLowerCase()) {
      case 'dd/mm/yyyy':
      default:
        return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }
  }
}
