import 'package:intl/intl.dart';

class DateFormatter {
  factory DateFormatter() {
    return _instance;
  }

  DateFormatter._create();

  static final _instance = DateFormatter._create();

  String formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }
}
