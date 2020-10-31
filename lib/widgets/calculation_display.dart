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

    final curScaleFactor = MediaQuery.of(context).textScaleFactor;

    return LayoutBuilder(builder: (ctx, constraints) {

      final _calculateButton = Container(
        height: constraints.maxHeight * 0.25,
        color: Theme
            .of(context)
            .accentColor,
        child: Row(children: [
          FlatButton(
              child: Text(
                  'Calculate',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20 * curScaleFactor,
                    color: Theme.of(context).primaryColor,
                  )
              ),
              onPressed:() {
                calculateScore(); userCalculationState();
              }
          ),
        ]),
      );

      return Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.15,
              child:_calculateButton,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              child:userCalculation.isEmpty ? Column(children: [
                FittedBox(
                  child: Text(
                    'No calculations have been made yet',
                    style:noCalculationsTextStyle,
                  ),
                ),
              ],)
              : Container(
                // ignore: missing_return
                child: ListView.builder(itemBuilder: (ctx,index){
                  if(index == 0){
                    return Card(
                      elevation:5,
                      child:Column(children: [
                        Text('${userCalculation[index].value}',
                          style:resultTextStyle,
                        )],
                      ),
                    );
                  }
                }),
              )
            ),],
        );
    });
  }}