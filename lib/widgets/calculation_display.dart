import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/calculated_values.dart';
import '../functions/calculate_time.dart';
import '../widgets/gradient_button.dart';
import '../widgets/default_text_widget.dart';


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

  @override
  Widget build(BuildContext context) {
    final mediaQuery  = MediaQuery.of(context);

    final calculateButton = GradientBorderButtonContainer(
        gradient:LinearGradient(
          colors:[
            Colors.red,
            Theme.of(context).primaryColor,
            Colors.red,
          ],
        ),
            child: DefaultTextWidget(
                textContent:'Calculate',
                fontWeight: FontWeight.bold,
                fontColor:Theme.of(context).primaryColor,
                fontSize: 22,
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
            width:mediaQuery.size.width * 1,
            height: constraints.maxHeight * 1,
            child:Column(
                children: [
                    _calculateButton,
                    userCalculation.isEmpty ? Container (
                      height:constraints.maxHeight * 0.5,
                      child: Center(
                            child: DefaultTextWidget(
                              textContent:'No calculations have been made yet',
                              fontColor: Colors.lightBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                    ) : Container(
                            height:constraints.maxHeight * 0.5,
                              alignment: Alignment.center,
                              child: new ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:userCalculation.length,
                                itemBuilder: (BuildContext ctx, int index) {
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width:constraints.maxWidth * 1,
                                          alignment:Alignment.center,
                                          child: DefaultTextWidget(
                                            textContent:userCalculation[index].value,
                                            fontColor: Colors.lightBlue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                          ),
                                        ),
                                      ],
                                    );
                                },
                              ),
                            ),
                     ],
                  ),
             );

    });
  }}