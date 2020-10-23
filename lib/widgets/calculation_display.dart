import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/calculated_values.dart';


class CalculatedValuesList extends StatelessWidget {
  final List<CalculatedValues> calculations;

  CalculatedValuesList(this.calculations);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:450,
      child:calculations.isEmpty ? Column(children: [
        Text('No calculations have been made yet'),
      ],)
      : ListView.builder(itemBuilder: (ctx,index){
        return Card(
          elevation:5,
          child:ListTile(
            leading:CircleAvatar(radius: 30,
              child:FittedBox(
                  child:Text('${calculations[index].value}')
              ),
            ),
            title:Text(''),
          ),
        );
      })


    );
  }
}
