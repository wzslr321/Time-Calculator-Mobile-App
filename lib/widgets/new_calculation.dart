import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/calculated_values.dart';

class NewCalculation extends StatefulWidget {

  NewCalculation();

  @override
  _NewCalculationState createState() => _NewCalculationState();
}
DateTime actualDateTime = DateTime.now();
String option;
String result;
String _isLessString;
int _calculationResult;
bool _isLessYears;
DateTime selectedDate;

final List<CalculatedValues> _userCalculation = [];

class _NewCalculationState extends State<NewCalculation> {


  final List<String> _calculateOptions =  ['Years', 'Months', 'Days',  'Hours', 'Minutes', 'Seconds'];



 calculateScore(DateTime actualDate, DateTime selectedDate, String option) {

   print(actualDate);
   print(selectedDate);
   print(option);

    actualDate = actualDateTime;

    if(actualDate == null || selectedDate == null || option.isEmpty)
      return null;

    selectedDate = selectedDate;
    option       = option;

    switch(option){
      case 'Years': {
        bool _checkDataYears(DateTime a, DateTime b){
          if(int.parse(DateFormat.m().format(actualDate)) - int.parse(DateFormat.m().format(selectedDate)) >= 1){
            _isLessYears = false;
            _isLessString = 'More';
          } else {
            _isLessYears = true;
            _isLessString = 'Less';
          }
          return _isLessYears;
        }

        _calculationResult = int.parse(DateFormat.y().format(selectedDate)) - int.parse(DateFormat.y().format(actualDate));

        if((_checkDataYears(selectedDate, actualDate)) == true){
          result = '$_isLessString than $_calculationResult years left!';
        } else {
          result = '$_isLessString than $_calculationResult years left!';
        }



      }
    }
    print('====!===!====!====!====!=');

        Navigator.of(context).pop();

        setState(() {
          _userCalculation.add(CalculatedValues(value: result));
        });


  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate:DateTime(2030),
    ).then( (pickedDate) {
        if(pickedDate == null)
          return;
        setState( () {
          selectedDate = pickedDate;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation:10,
      child: Container(
        padding:EdgeInsets.all(15),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DropdownButton<String>(
              onChanged:(String value){
                setState(() {
                   option = value;
                });
              },
              value: option,
              hint:Text('${option != null ? option: 'Select option'}'),
                items: _calculateOptions.map((String value){
                  return new DropdownMenuItem<String>(
                      value:value,
                      child:new Text(value)
                  );
                }).toList(),),
            Container(
              height:70,
              child:Row(children: [
                Expanded(
                    child: Text('Picked date : ${selectedDate != null ? DateFormat.yMd().format(selectedDate): 'No date chosen!'}'),
                ),
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  child:Text(
                    'Choose data',
                    style:TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: _showDatePicker,
                ),
              ],)
            ),
            Container(
              height:100,
              color:Theme.of(context).accentColor,
              child:Row(children: [
                FlatButton(
                  child:Text(
                    'Calculate',
                    style:TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color:Theme.of(context).primaryColor,
                    )
                  ),
                  onPressed:() => calculateScore,
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

