import 'package:flutter/material.dart';

import './widgets/new_calculation.dart';
import './widgets/calculation_display.dart';
import './models/calculated_values.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time calculator',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        accentColor:Color.fromRGBO(196 , 195, 208, 0.2),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {

  void _addUserCalc() {
    setState(() {
      userCalculation.add(CalculatedValues(value: 'test'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text('Time calculator')
        ),
        body:SingleChildScrollView(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              NewCalculation(),
              CalculatedValuesList(userCalculation),
            ],
          )
        )
    );
  }
}