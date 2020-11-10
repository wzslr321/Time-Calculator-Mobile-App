import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/calculated_values.dart';
import '../functions/calculate_time.dart';
import '../widgets/gradient_button.dart';
import '../widgets/calculated_values_container.dart';


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

      return CalculatedValueContainer(
        calculateButton: CalculateGradientButtonTest(
          onPressed:() {
            calculateScore(); userCalculationState();
          },
        ),
      );

  }}
