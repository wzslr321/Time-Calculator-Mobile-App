import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:time_app/widgets/calculation_display.dart';

import '../models/calculated_values.dart';

class NewCalculation extends StatefulWidget {
  NewCalculation();

  @override
  _NewCalculationState createState() => _NewCalculationState();
}

DateTime _actualDate = new DateTime.now();
DateTime _selectedDate;

String _option;
String _result;
String _isLessString;

int _calculationResult;

bool _isLessYears;

List<CalculatedValues> userCalculation = [];
final List<String> _calculateOptions =  ['Years', 'Months', 'Days',  'Hours', 'Minutes', 'Seconds'];

class _NewCalculationState extends State<NewCalculation> {

 void _calculateScore() {
   final bool _isLess = _isLessYears;

   if(_actualDate == null || _selectedDate == null || _option.isEmpty)
     return null;

   switch(_option){
     case 'Years': {
       bool _checkDataYears(DateTime a, DateTime b){
         if(int.parse(DateFormat.m().format(_selectedDate)) - int.parse(DateFormat.m().format(_actualDate)) >= 1){
           _isLessYears = false;
           _isLessString = 'More';
         } else {
           _isLessYears = true;
           _isLessString = 'Less';
         }
         return _isLess;
       }

       _calculationResult = int.parse(DateFormat.y().format(_selectedDate)) - int.parse(DateFormat.y().format(_actualDate));

       if((_checkDataYears(_selectedDate, _actualDate)) == true){
         _result = '$_isLessString than $_calculationResult years left!';
       } else {
         _result = '$_isLessString than $_calculationResult years left!';
       }

     }
   }

   showModalBottomSheet(context: context, builder:(_){
     userCalculation.add(CalculatedValues(value: _result));
      return CalculatedValuesList(userCalculation);
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
          _selectedDate = pickedDate;
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
                   _option = value;
                });
              },
              value: _option,
              hint:Text('${_option != null ? _option: 'Select option'}'),
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
                    child: Text('Picked date : ${_selectedDate != null ? DateFormat.yMd().format(_selectedDate): 'No date chosen!'}'),
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
                  onPressed:_calculateScore,
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

