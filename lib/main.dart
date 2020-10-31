import 'package:flutter/material.dart';

import './widgets/new_calculation.dart';
import './widgets/calculation_display.dart';


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
        fontFamily: 'Quicksand',
        textTheme:ThemeData.light().textTheme.copyWith(
          headline6:TextStyle(
            fontFamily:'OpenSans', fontSize:20,fontWeight: FontWeight.bold,
          ),
        ),
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

  @override
  Widget build(BuildContext context) {

    final curScaleFactor = MediaQuery.of(context).textScaleFactor;

    final appBarTextStyle = TextStyle(
      fontSize:20 * curScaleFactor,
    );

    final _appBar =  AppBar(
      title:Text(
        'Time calculator',
        style:appBarTextStyle,
      ),
    );

    final mediaQuery = MediaQuery.of(context).size.height - _appBar.preferredSize.height - MediaQuery.of(context).padding.top;

    return Scaffold(
        appBar:_appBar,
        body:SingleChildScrollView(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  height: mediaQuery * 0.4,
                  child: NewCalculation(),
              ),
              Container(
                  height: mediaQuery * 0.6,
                  child: CalculatedValuesList(userCalculation),
              ),],
          ),
        ),
    );
  }}