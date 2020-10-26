import 'package:flutter/material.dart';

import '../models/calculated_values.dart';


class CalculatedValuesList extends StatefulWidget {
  final List<CalculatedValues> calculations;

  CalculatedValuesList(this.calculations);

  @override
  _CalculatedValuesListState createState() => _CalculatedValuesListState();
}

class _CalculatedValuesListState extends State<CalculatedValuesList> {



  @override
  Widget build(BuildContext context) {
    return Container(
      height:450,
      child:widget.calculations.isEmpty ? Column(children: [
        Text('No calculations have been made yet'),
      ],)
      : ListView.builder(itemBuilder: (ctx,index){
        return Card(
          elevation:5,
          child:ListTile(
            leading:CircleAvatar(radius: 30,
              child:FittedBox(
                  child:Text('${widget.calculations[index].value}')
              ),
            ),
            title:Text(''),
          ),
        );
      })


    );
  }
}
