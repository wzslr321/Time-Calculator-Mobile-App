import 'package:flutter/foundation.dart';

class CalculatedValues {
  final int years;
  final int months;
  final int days;
  final int weekDays;
  final int weekends;
  final int hours;
  final int minutes;
  final int seconds;

  CalculatedValues({
    @required this.years,
    @required this.months,
    @required this.days,
    @required this.weekDays,
    @required this.weekends,
    @required this.hours,
    @required this.minutes,
    @required this.seconds,
  });
}