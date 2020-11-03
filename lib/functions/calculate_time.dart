import 'package:intl/intl.dart';

import '../models/date_formats.dart';

// Global variables used in new_calculation && calculation_display
DateTime selectedDate;
DateTime actualDate = new DateTime.now();

String option;
String result;

void calculateScore() {


  String _isLessString;
  bool _isLessYears;
  int _calculationResult;

   if( selectedDate == null || option.isEmpty)
      result = 'Please enter date first!';
   if(actualDate == null )
      result = 'Weird error occurred, please report it to our developers';

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

  final List<int> formatsList = [
    int.parse(DateFormat.y().format(selectedDate))  - int.parse(DateFormat.y().format(actualDate)),
    int.parse(DateFormat.M().format(selectedDate))  - int.parse(DateFormat.M().format(actualDate)),
    int.parse(DateFormat.d().format(selectedDate))  - int.parse(DateFormat.d().format(actualDate)),
    int.parse(DateFormat.H().format(selectedDate))  - int.parse(DateFormat.H().format(actualDate)),
    int.parse(DateFormat.m().format(selectedDate))  - int.parse(DateFormat.m().format(actualDate)),
    int.parse(DateFormat.s().format(selectedDate))  - int.parse(DateFormat.s().format(actualDate)),
  ];

  int _allNumbers;
  int _calcLength;

  switch(option) {
    case 'Years' : {
       _calcLength = 1;
       break;
    }
    case 'Months': {
      _calcLength = 2;
      break;
    }
    case 'Days': {
      _calcLength = 3;
      break;
    }
    case 'Hours': {
      _calcLength = 4;
      break;
    }
    case 'Minutes': {
      _calcLength = 5;
      break;
    }
    case 'Seconds': {
      _calcLength = 6;
      break;
    }
  }

  for(int i = 0; i < _calcLength; i++ )
    switch(_calcLength){
      case 1 : {
        _allNumbers = formatsList[i];
        break;
      }
      case 2: {
        _allNumbers = formatsList[0] * 12 + formatsList[1];
        break;
      }
      case 3: {
        _allNumbers = formatsList[0] * 12 * 30 + formatsList[1] * 30 + formatsList[2];
        break;
      }
      case 4: {
        _allNumbers = formatsList[0] * 12 * 30 * 24 + formatsList[1] * 30 * 24 + formatsList[2] * 24 + formatsList[3];
        break;
      }
      case 5: {
        _allNumbers = formatsList[0] * 12 * 30 * 24 * 60 + formatsList[1] * 30 * 24 * 60 + formatsList[2] * 24 * 60 + formatsList[3] * 60 + formatsList[4];
        break;
      }
      case 6: {
        _allNumbers = formatsList[0] * 12 * 30 * 24 * 60 * 60 + formatsList[1] * 30 * 24 * 60 * 60 + formatsList[2] * 24 * 60 * 60 + formatsList[3] * 60 * 60 + formatsList[4] * 60 + formatsList[5];
        break;
      }
    }

  switch(option) {
    case 'Years': {
        _calculationResult = _allNumbers;

        _checkIsLess(selectedDate, actualDate);
        (_isLessString != null && _calculationResult != null)
            ? result = '$_isLessString than $_calculationResult years left!'
            : result = 'Error occurred';
        break;
      }
    default : {
      result = '$_allNumbers left';
    }
  }}