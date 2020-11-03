import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/new_calculation.dart';
import '../models/calculated_values.dart';
import '../functions/calculate_time.dart';
import '../widgets/gradient_button.dart';


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


  @override
  Widget build(BuildContext context) {
    // Variables responsible for responsiveness
    final curScaleFactor   = MediaQuery.of(context).textScaleFactor;
    final mediaQueryWidth  = MediaQuery.of(context).size.width;

    // Style variables which requires context
    final btnTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22 * curScaleFactor,
      color: Theme.of(context).primaryColor,
      fontFamily: 'Quicksand',
    );

    final calculateButton = GradientBorderButtonContainer(
        gradient:LinearGradient(
          colors:[
            Colors.red,
            Theme.of(context).primaryColor,
            Colors.red,
          ],
        ),
            child: FittedBox(
              child: Text(
                'Calculate',
                style:btnTextStyle,
              ),
            ),
            onPressed:() {
              calculateScore(); userCalculationState();
            },
        );

    return LayoutBuilder(builder: (ctx, constraints) {

      final _calculateButton = Card(
        elevation: 15,
        child:Container(
          decoration: new BoxDecoration(
            border:Border(
              top:BorderSide(
                color:Theme.of(context).primaryColor,
                width:1.5,
              ),
              bottom:BorderSide(
                color:Theme.of(context).primaryColor,
                width:1.5,
              ),
            ),
          ),
          height: constraints.maxHeight * 0.45,
          child: Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [calculateButton,]
          ),
        ),
      );

      return Container(
            width:mediaQueryWidth * 1,
            height: constraints.maxHeight * 1,
            child:Column(
                children: [
                    _calculateButton,
                    userCalculation.isEmpty ? Container (
                      height:constraints.maxHeight * 0.5,
                      child:
                        Container(
                          child: Center(
                            child: Text(
                              'No calculations have been made yet',
                              textAlign:TextAlign.center,
                              style:resultTextStyle,
                            ),
                          ),
                        ),
                    ) : Container(
                      alignment:Alignment.center,
                      // ignore: missing_return
                      child: ListView.builder(
                        itemCount:1,
                        // ignore: missing_return
                        itemBuilder:(BuildContext ctx, int index){
                          if(index == 0){
                            return ListTile(
                                title:Center(
                                  child: Text(
                                    '${userCalculation[index].value}',
                                    textAlign:TextAlign.center,
                                    style:resultTextStyle,
                                  ),
                                )
                            );
                          }
                        },
                      ),
                    ),
                    ],
                  ),
             );

    });
  }}