import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewCalculation extends StatefulWidget {
  final Function calculate;

  NewCalculation(this.calculate);

  @override
  _NewCalculationState createState() => _NewCalculationState();
}

class Item {
  const Item(this.name);
  final String name;
}

class _NewCalculationState extends State<NewCalculation> {
  DateTime _actualDate;
  DateTime _selectedDate;

  String _option;

  final List<String> _calculateOptions =  ['Years', 'Months', 'Days', 'WeekDays', 'Weekends', 'Hours', 'Minutes', 'Seconds'];
  final  _calculateOptionController = TextEditingController();

  void _calculateDate() {

    final _enteredOption = _calculateOptionController.text;

     if(_actualDate == null || _selectedDate == null || _enteredOption.isEmpty)
       return;

     widget.calculate(
       _actualDate,
       _selectedDate,
       _enteredOption,
     );

     Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate:DateTime.now(),
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
                  textColor: Theme.of(context).primaryColorLight,
                  child:Text(
                    'Choose data',
                    style:TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: _showDatePicker,
                )
              ],)
            ),
          ],
        ),
      ),
    );
  }
}

