import 'package:flutter/material.dart';

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
      // ignore: missing_return
      : ListView.builder(itemBuilder: (ctx,index){
        if(index == 0) {
          return Card(
            elevation:5,
            child:Column(children: [
              // ignore: unrelated_type_equality_checks
              Text('${userCalculation[index].value}'),
            ],
            ),
          );
        }
      })


    );
  }
}
