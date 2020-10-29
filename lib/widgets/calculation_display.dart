import 'package:flutter/material.dart';

import '../widgets/new_calculation.dart';
import '../models/calculated_values.dart';

class CalculatedValuesList extends StatefulWidget {

  CalculatedValuesList(userCalculation);

  @override
  _CalculatedValuesListState createState() => _CalculatedValuesListState();
}

class _CalculatedValuesListState extends State<CalculatedValuesList> {

  List<CalculatedValues> userCalculations;

  void userCalculationState() {
    setState((){
        userCalculation = userCalculations ;
    });
  }


  final resultTextStyle = TextStyle(
    color:Colors.lightBlue,
    fontSize:26,
    fontWeight: FontWeight.bold,
  );

  final noCalculationsTextStyle = TextStyle(
      color:Colors.lightBlue,
      fontSize:24,
      fontWeight: FontWeight.normal,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height:450,
      child:userCalculation.isEmpty ? Column(children: [
        SizedBox(
            height:200,
            child: Text(
                'No calculations have been made yet',
                style:noCalculationsTextStyle,
            ),
        ),
      ],)
      // ignore: missing_return
      : Container(
        // ignore: missing_return
        child: ListView.builder(itemBuilder: (ctx,index){
          if(index == 0) {
            return Card(
              elevation:5,
              child:Column(children: [
                Text('${userCalculation[index].value}',
                  style:resultTextStyle,
                ),
                ],
              ),
            );
          }
        }),
      )
    );
  }
}