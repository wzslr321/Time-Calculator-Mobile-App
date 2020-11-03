import 'package:intl/intl.dart';
import '../functions/calculate_time.dart';

final List<int> formatsList = [
  int.parse(DateFormat.y().format(selectedDate))  - int.parse(DateFormat.y().format(actualDate)),
  int.parse(DateFormat.M().format(selectedDate))  - int.parse(DateFormat.y().format(actualDate)),
  int.parse(DateFormat.d().format(selectedDate))  - int.parse(DateFormat.y().format(actualDate)),
  int.parse(DateFormat.H().format(selectedDate))  - int.parse(DateFormat.y().format(actualDate)),
  int.parse(DateFormat.m().format(selectedDate))  - int.parse(DateFormat.y().format(actualDate)),
  int.parse(DateFormat.s().format(selectedDate))  - int.parse(DateFormat.y().format(actualDate)),
];

