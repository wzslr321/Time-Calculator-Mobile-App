import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../functions/calculate_time.dart';
import '../models/default_text_widget_class.dart';


class NewCalculation extends StatefulWidget {
  NewCalculation();

  @override
  _NewCalculationState createState() => _NewCalculationState();
}

/*
   Global userCalculation variable used in calculation_display file.
   I use List, because in future I plan to display previous calculations.
   In actual situation, better would be simple string with result.
 */

class _NewCalculationState extends State<NewCalculation> {

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

    final pickedDateText = 'Picked date : ${selectedDate != null ? DateFormat.yMd().format(selectedDate) : 'No date chosen!'}';

    return LayoutBuilder(builder: (ctx, constraints) {

      BoxDecoration boxDecoration(){
        return BoxDecoration(
          border:Border(
            top:BorderSide(
              color:Theme.of(context).primaryColor, width:1,
            )
          )
        );
      }

      final _dropDownButton = DropdownButton<String>(
            hint: Container(
              height:constraints.maxHeight * 0.25,
              width:constraints.maxWidth * 0.75,
              margin:const EdgeInsets.only(top: 10),
              child: SizedBox(
                child: DefaultTextWidget(
                  textContent:'${option != null ? option : 'Select option'}',
                  fontSize:20,
                  isFittedBox:false
                ),
              ),
            ),
            items: calculateOptions.map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.075,
                    decoration: boxDecoration(),
                    child: Center(
                      child:DefaultTextWidget(
                        textContent: value,
                      )
                    )
                ),
              );
            }).toList(),
            onChanged: (String value) {
              setState(() {
                option = value;
              });
            },);

      final _datePicker = Container(
        height:constraints.maxHeight * 0.3,
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment:CrossAxisAlignment.end,
          children: [
            DefaultTextWidget(
              textContent: pickedDateText,
            ),
            InkWell(
              highlightColor:Colors.transparent,
              splashColor:Colors.transparent,
              onTap:_showDatePicker,
                child: Align(
                alignment:Alignment.bottomCenter,
                   child:DefaultTextWidget(
                     textContent: 'Choose date',
                     fontColor:Theme.of(context).primaryColor,
                     fontWeight:FontWeight.bold ,
                   )
                ),
            ),
          ],),
      );

      return Container(
          padding:const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _dropDownButton,
              _datePicker,
            ],
          ),
        );
    },);

  }}
