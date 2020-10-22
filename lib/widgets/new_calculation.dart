import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewCalculation extends StatefulWidget {
  final Function calculationValues;

  NewCalculation(this.calculationValues);

  @override
  _NewCalculationState createState() => _NewCalculationState();
}

DateTime _actualDate = DateTime.now();
DateTime _selectedDate;

String _option;
int _score;

int calculateScore(DateTime a, DateTime b) {
  final int calculationScore = _score;
  final _enteredOption = _option;

  int result = int.parse(DateFormat.y().format(a)) - int.parse(DateFormat.y().format(b));

  if(_actualDate == null || _selectedDate == null || _enteredOption.isEmpty)
    return null;
  return result;

}

class _NewCalculationState extends State<NewCalculation> {


  final List<String> _calculateOptions =  ['Years', 'Months', 'Days',  'Hours', 'Minutes', 'Seconds'];



  void _calculateDate() {

     widget.calculationValues(
        calculateScore(_selectedDate, _actualDate)
     );

     Navigator.of(context).pop();

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
                )
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
                  onPressed: _calculateDate,
                )
              ],),
            ),
          ],
        ),
      ),
    );
  }
}

