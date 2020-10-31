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
    fontSize:22,
    fontWeight: FontWeight.bold,
  );

  final noCalculationsTextStyle = TextStyle(
      color:Colors.lightBlue,
      fontSize:22,
      fontWeight: FontWeight.normal,
  );





  @override
  Widget build(BuildContext context) {
    // Variables responsible for responsiveness
    final curScaleFactor   = MediaQuery.of(context).textScaleFactor;
    final mediaQueryWidth  = MediaQuery.of(context).size.width;

    // Style variables which requires context
    final btnTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20 * curScaleFactor,
      color: Theme.of(context).primaryColor,
    );


    return LayoutBuilder(builder: (ctx, constraints) {

      final _calculateButton = Container(
        height: constraints.maxHeight * 0.25,
        color: Theme.of(context).accentColor,
        child: Row(children: [
          FlatButton(
              child: Text(
                  'Calculate',
                  style:btnTextStyle,
              ),
              onPressed:() {
                calculateScore(); userCalculationState();
              }
          ),
        ]),
      );

      return Container(
        width: mediaQueryWidth * 1,
        height:constraints.maxHeight * 1,
        child: Column(
            children: [
              Container(
                width:mediaQueryWidth * 1,
                height: constraints.maxHeight * 0.15,
                child:_calculateButton,
              ),
              Container(
                width: mediaQueryWidth * 1,
                height: constraints.maxHeight * 0.2,
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
                  child: ListView.builder(
                    itemCount:5,
                    // ignore: missing_return
                    itemBuilder:(BuildContext ctx, int index){
                      if(index == 0){
                        return ListTile(
                            leading: Icon(Icons.list),
                            trailing: Text('${index + 1}',
                              style: TextStyle(
                                  color: Colors.green,fontSize: 12),),
                            title:Text(
                              '${userCalculation[index].value}',
                              style:resultTextStyle,
                            )
                        );
                      }
                    },
                  ),
                )
              ),],
          ),
      );
    });
  }}