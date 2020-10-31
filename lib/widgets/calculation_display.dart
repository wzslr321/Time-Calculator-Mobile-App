import 'package:flutter/material.dart';

import '../widgets/new_calculation.dart';
import '../models/calculated_values.dart';
import '../functions/calculate_time.dart';


class CalculatedValuesList extends StatefulWidget {

  CalculatedValuesList(userCalculation);

  @override
  _CalculatedValuesListState createState() => _CalculatedValuesListState();

}


class _CalculatedValuesListState extends State<CalculatedValuesList> {

  void userCalculationState() {
      setState((){
        userCalculation.isEmpty ? userCalculation.add(CalculatedValues(value: result)) :
            userCalculation[0] = CalculatedValues(value: result);
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
      child:userCalculation.isEmpty ? Column(children: [
        SizedBox(
            height:200,
            child: Text(
                'No calculations have been made yet',
                style:noCalculationsTextStyle,
            ),
        ),
        FlatButton(
            child: Text(
                'Calculate',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                )
            ),
            onPressed:() {
              calculateScore(); userCalculationState();
            }
        ),
      ],)
      // ignore: missing_return
      : Container(
        // ignore: missing_return
        child: ListView.builder(itemBuilder: (ctx,index){
          if(index == 0){
            return Card(
              elevation:5,
              child:Column(children: [
                Text('${userCalculation[index].value}',
                  style:resultTextStyle,
                ),FlatButton(
                    child: Text(
                        'Calculate',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                        )
                    ),
                    onPressed:() {
                      calculateScore(); userCalculationState();
                    }
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