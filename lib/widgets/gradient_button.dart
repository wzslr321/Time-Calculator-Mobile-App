import 'package:flutter/material.dart';

import '../models/gradient_button_class.dart';
import '../models/default_text_widget_class.dart';

class CalculateGradientButtonTest extends StatelessWidget {
  @required final onPressed;

  CalculateGradientButtonTest({
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery  = MediaQuery.of(context);

    final _calculateGradientButton = GradientBorderButtonContainer(
        gradient:LinearGradient(
          colors:[
            Colors.red,
            Theme.of(context).primaryColor,
            Colors.red,
          ],
        ),
        child: DefaultTextWidget(
          textContent:'Calculate',
          fontWeight: FontWeight.bold,
          fontColor:Theme.of(context).primaryColor,
          fontSize: 22,
        ),
        onPressed:onPressed
    );

    final borderSide = BorderSide(
      color:Theme.of(context).primaryColor,
      width:1.5,
    );

    final _calculateButton = Card(
      elevation: 15,
      child:Container(
        decoration:BoxDecoration(
          border:Border(
            top:borderSide,
            bottom:borderSide,
          ),
        ),
        height: mediaQuery.size.height * 0.3,
        child: Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [_calculateGradientButton,]
        ),
      ),
    );

    return _calculateButton;
  }
}