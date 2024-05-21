import 'package:intl/intl.dart';

extension IntExtensions on int {
  String toPrice() {
    return NumberFormat('###,###,### ₽', 'ru_RU').format(this);
  }
}

extension DateTimeExtensions on DateTime {
  String toCheapFormat() {
    return DateFormat('dd MMMM, E').format(this);
  }

  String to24HoursMinutes() {
    return DateFormat(DateFormat.HOUR24_MINUTE).format(this);
  }
}
