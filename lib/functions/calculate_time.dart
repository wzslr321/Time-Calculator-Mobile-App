import 'package:intl/intl.dart';


// Global variables used in new_calculation && calculation_display
DateTime selectedDate;

String option;
String result;

void calculateScore() {

  DateTime _actualDate = new DateTime.now();
  String _isLessString;
  bool _isLessYears;
  int _calculationResult;

   if( selectedDate == null || option.isEmpty)
      result = 'Please enter date first!';
   if(_actualDate == null )
      result = 'Weird error occurred, please report it to our developers';

  switch(option) {
    case 'Years':
      {
        bool _checkIsLess(DateTime selected, DateTime actual) {
          if (int.parse(DateFormat.M().format(selectedDate)) -
              int.parse(DateFormat.M().format(_actualDate)) >= 1) {
            _isLessYears = false;
            _isLessString = 'More';
          } else {
            _isLessYears = true;
            _isLessString = 'Less';
          }
          return _isLessYears;
        }

        _calculationResult = int.parse(DateFormat.y().format(selectedDate)) -
            int.parse(DateFormat.y().format(_actualDate));

        _checkIsLess(selectedDate, _actualDate);
        (_isLessString != null && _calculationResult != null)
            ? result = '$_isLessString than $_calculationResult years left!'
            : result = 'Error occurred';
      }
  }}