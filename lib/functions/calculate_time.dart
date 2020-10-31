import 'package:intl/intl.dart';

import '../widgets/new_calculation.dart';
import '../models/calculated_values.dart';
import '../widgets/calculation_display.dart';

DateTime actualDate = new DateTime.now();
DateTime selectedDate;

String option;
String result;
String isLessString;

int calculationResult;

bool isLessYears;
final isLess = isLessYears;

calculateScore() {

  if(actualDate == null || selectedDate == null || option.isEmpty)
    return null;

  switch(option){
    case 'Years': {
      bool _checkDataYears(DateTime a, DateTime b){
        if(int.parse(DateFormat.m().format(selectedDate)) - int.parse(DateFormat.m().format(actualDate)) >= 1){
          isLessYears = false;   isLessString = 'More';
        } else {
          isLessYears = true;    isLessString = 'Less';
        }
        return isLess;
      }

      calculationResult = int.parse(DateFormat.y().format(selectedDate)) - int.parse(DateFormat.y().format(actualDate));

      if((_checkDataYears(selectedDate, actualDate)) == true){
        result = '$isLessString than $calculationResult years left!';
      } else {
        result = '$isLessString than $calculationResult years left!';
      }

        return result;


    }
  }

}