import 'package:intl/intl.dart';

import '../models/calculated_values.dart';

// Global variables used in new_calculation && calculation_display && calculation_options
List<CalculatedValues> userCalculation = [];
final List<String> calculateOptions =  ['Years', 'Months', 'Days',  'Hours', 'Minutes', 'Seconds'];

DateTime selectedDate;
DateTime actualDate = new DateTime.now();

String option;
String result;


// This function is going to be refactored someday, I know it is ugly as hell.
String calculateScore() {

    if(option == null || selectedDate == null) {
      return result = 'Please enter date and option first!';
  }

  final List<int> formatsList = [
    int.parse(DateFormat.y().format(selectedDate))  - int.parse(DateFormat.y().format(actualDate)),
    int.parse(DateFormat.M().format(selectedDate))  - int.parse(DateFormat.M().format(actualDate)),
    int.parse(DateFormat.d().format(selectedDate))  - int.parse(DateFormat.d().format(actualDate)),
    int.parse(DateFormat.H().format(selectedDate))  - int.parse(DateFormat.H().format(actualDate)),
    int.parse(DateFormat.m().format(selectedDate))  - int.parse(DateFormat.m().format(actualDate)),
    int.parse(DateFormat.s().format(selectedDate))  - int.parse(DateFormat.s().format(actualDate)),
  ];


  String _isLessString;
  bool _isLessYears;
  int _calculationResult;

  int _allNumbers;
  int _calcLength;

  for(int i = 0; i < calculateOptions.length; i++){
    if(option == calculateOptions[i]){
      _calcLength = i;
    }
  }

  for(int i = 0; i < formatsList.length; i++ )
    switch(_calcLength){
      case 0 :{
        _allNumbers = formatsList[0];
        break;
      }
      case 1: {
        _allNumbers = formatsList[0] * 12 + formatsList[1];
        break;
      }
      case 2: {
        _allNumbers = formatsList[0] * 360 + formatsList[1] * 30 + formatsList[2];
        break;
      }
      case 3: {
        _allNumbers = formatsList[0] * 8640 + formatsList[1] * 720 + formatsList[2] * 24 + formatsList[3];
        break;
      }
      case 4: {
        _allNumbers = formatsList[0] * 518400 + formatsList[1] * 43200 + formatsList[2] * 1440 + formatsList[3] * 60 + formatsList[4];
        break;
      }
      case 5: {
        _allNumbers = formatsList[0] * 3110400 + formatsList[1] * 2592000 + formatsList[2] * 86400 + formatsList[3] * 3600 + formatsList[4] * 60 + formatsList[5];
        break;
      }
    }

  bool _checkIsLess(DateTime selected, DateTime actual) {
    if (int.parse(DateFormat.M().format(selectedDate)) -
        int.parse(DateFormat.M().format(actualDate)) >= 1) {
      _isLessYears = false;
      _isLessString = 'More';
    } else {
      _isLessYears = true;
      _isLessString = 'Less';
    }
    return _isLessYears;
  }

  _allNumbers > 0 ? _allNumbers = _allNumbers : _allNumbers = 0;


  switch(option) {
    case 'Years': {
      _calculationResult = _allNumbers;
      _checkIsLess(selectedDate, actualDate);

      _allNumbers == 0 ? result = 'You have selected the current year! \n Change calculate option or date. '
          : (_isLessString != null && _calculationResult != null)
          ? result = '$_isLessString than $_calculationResult years left!'
          : result = 'Error occurred';
      break;
    }
    default : {
      final String singularOption = option.substring(0,option.length -1).toLowerCase();
      _allNumbers == 0
          ? option != 'Months'
            ?  result = 'You have selected the current day! \n Change calculate option or date. '
            :  result = 'You have selected the current $singularOption ! \n Change calculate option or date. '
          : _allNumbers == 1
            ? result = '$_allNumbers $singularOption left!'
            : result = '$_allNumbers ${option.toLowerCase()} left!';
    }
  }

  return result;

}