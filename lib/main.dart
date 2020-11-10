import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';


import './widgets/new_calculation.dart';
import './widgets/calculation_display.dart';
import './functions/calculate_time.dart';
import './widgets/default_text_widget.dart';

void main() {
  // Options below allow to vertical usage of app only
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
  ]);
  runApp(MyApp());
}
// If there is not any PreferredOrientation, it is possible to
// check user`s view mode with MediaQuery.

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final appTheme = ThemeData(
      primarySwatch: Colors.lightBlue,
      accentColor:Color.fromRGBO(196 , 195, 208, 0.2),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: 'Quicksand',
      textTheme:ThemeData.light().textTheme.copyWith(
        headline6:TextStyle(
        fontFamily:'OpenSans', fontSize:20,fontWeight: FontWeight.bold,
        ),
      ),
    );

    return  MaterialApp(
      title: 'Time calculator',
      theme:appTheme,
        home: MyHomePage()
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

    final PreferredSizeWidget _appBar = Platform.isIOS ?
    CupertinoNavigationBar(
      middle:const DefaultTextWidget(
         textContent: 'Time app',
         fontSize: 20,
      ),
    ) : AppBar(
      title:const DefaultTextWidget(
         textContent: 'Time app',
         fontSize: 20,
      ),
    );

    final mediaQuery = MediaQuery.of(context).size.height - _appBar.preferredSize.height - MediaQuery.of(context).padding.top;

    final singleScrollViewWidget =
    SafeArea(
      child:SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: mediaQuery * 0.25,
              child: NewCalculation(),
            ),
            Container(
              height: mediaQuery * 0.75,
              child: CalculatedValuesList(userCalculation),
            ),],
        ),
      ),
    );


    return Platform.isIOS ? CupertinoPageScaffold(
      navigationBar:_appBar,
      child:singleScrollViewWidget
    ) : Scaffold(
        appBar:_appBar,
        body:singleScrollViewWidget
    );
  }}