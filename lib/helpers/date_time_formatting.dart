import 'package:intl/intl.dart';

String covertToReadableDateandTime(DateTime date) {
  // Day number
  String dayNumber = DateFormat('d').format(date);
  // Day month
  String month = DateFormat('MMMM').format(date);
  // Day name
  String dayName = DateFormat('EEEE').format(date); // e.g., Tuesday

  // Time (12-hour with AM/PM)
  String time = DateFormat('hh:mm a').format(date); // e.g., 09:30 AM

  // Or combine them:
  String formatted = '$dayName $dayNumber, $month at $time';
  return formatted;
}
