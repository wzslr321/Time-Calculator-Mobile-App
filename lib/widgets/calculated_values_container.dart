import 'package:flutter/material.dart';

import '../functions/calculate_time.dart';
import '../models/default_text_widget_class.dart';

class CalculatedValueContainer extends StatelessWidget {

  final calculateButton;

  CalculatedValueContainer({
    this.calculateButton
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery  = MediaQuery.of(context);

    return  LayoutBuilder(builder: (ctx, constraints) {

      final noCalculatedValueContainerWidget = Container (
        height:constraints.maxHeight * 0.5,
        child: Center(
          child:const DefaultTextWidget(
            textContent:'No calculations have been made yet',
            fontColor: Colors.lightBlue,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      );

      final calculatedValuesContainerWidget = Container(
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
      );

      return  Container(
        width:mediaQuery.size.width * 1,
        height: constraints.maxHeight * 1,
        child:Column(
          children: [
            calculateButton,
            userCalculation.isEmpty ? noCalculatedValueContainerWidget  : calculatedValuesContainerWidget
          ],
        ),
      );

    },);
  }}
