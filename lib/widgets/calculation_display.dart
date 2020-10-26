import 'package:flutter/material.dart';

import '../models/calculated_values.dart';
import '../widgets/new_calculation.dart';


class CalculatedValuesList extends StatefulWidget {



  CalculatedValuesList(userCalculation);

  @override
  _CalculatedValuesListState createState() => _CalculatedValuesListState();
}

class _CalculatedValuesListState extends State<CalculatedValuesList> {



  @override
  Widget build(BuildContext context) {
    return Container(
      height:450,
      child:userCalculation.isEmpty ? Column(children: [
        Text('No calculations have been made yet'),
      ],)
      : ListView.builder(itemBuilder: (ctx,index){
        return Card(
          elevation:5,
          child:Column(children: [
            Text('$userCalculation[index].value}'),
          ],
          ),
        );
      })


    );
  }
}
