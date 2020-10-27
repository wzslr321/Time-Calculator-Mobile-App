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


  @override
  Widget build(BuildContext context) {
    return Container(
      height:450,
      child:userCalculation.isEmpty ? Column(children: [
        Text('No calculations have been made yet'),
      ],)
      // ignore: missing_return
      : ListView.builder(itemBuilder: (ctx,index){
        if(index == 0) {
          return Card(
            elevation:5,
            child:Column(children: [
              Text('${userCalculation[index].value}'),
              ],
            ),
          );
        }
      })
    );
  }
}