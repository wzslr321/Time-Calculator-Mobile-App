import 'package:intl/intl.dart';


DateTime _actualDate = new DateTime.now();
DateTime selectedDate;

String option;
String result;
String isLessString;

int calculationResult;

bool isLessYears;
final isLess = isLessYears;

calculateScore() {

  if(_actualDate == null || selectedDate == null || option.isEmpty)
    return null;

  switch(option){
    case 'Years': {
      bool _checkDataYears(DateTime a, DateTime b){
        if(int.parse(DateFormat.m().format(selectedDate)) - int.parse(DateFormat.m().format(_actualDate)) >= 1){
          isLessYears = false;   isLessString = 'More';
        } else {
          isLessYears = true;    isLessString = 'Less';
        }
        return isLess;
      }

      calculationResult = int.parse(DateFormat.y().format(selectedDate)) - int.parse(DateFormat.y().format(_actualDate));

      if((_checkDataYears(selectedDate, _actualDate)) == true){
        result = '$isLessString than $calculationResult years left!';
      } else {
        result = '$isLessString than $calculationResult years left!';
      }

        return result;


    }
  }

}