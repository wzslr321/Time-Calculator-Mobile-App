import 'package:flutter/material.dart';

import '../models/calculated_values.dart';
import '../widgets/new_calculation.dart';


class CalculatedValuesList extends StatefulWidget {



  var userCalculationList =  userCalculation;

  CalculatedValuesList(this.userCalculationList);

  @override
  _CalculatedValuesListState createState() => _CalculatedValuesListState();
}

class _CalculatedValuesListState extends State<CalculatedValuesList> {



  @override
  Widget build(BuildContext context) {
    return Container(
      height:450,
      child:widget.userCalculationList.isEmpty ? Column(children: [
        Text('No calculations have been made yet'),
      ],)
      : ListView.builder(itemBuilder: (ctx,index){
        return Card(
          elevation:5,
          child:ListTile(
            leading:CircleAvatar(radius: 30,
              child:FittedBox(
                  child:Text('${widget.userCalculationList[index].value}')
              ),
            ),
            title:Text(''),
          ),
        );
      })


    );
  }
}
