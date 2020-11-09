import 'package:flutter/material.dart';

class DefaultTextWidget extends StatelessWidget {
  @required final String textContent;
  final FontWeight fontWeight;
  final double fontSize;
  final String fontFamily;
  final Color fontColor;
  final TextAlign textAlign;
  final bool isFittedBox;



  DefaultTextWidget({
    this.textContent,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.fontColor = Colors.black,
    this.fontFamily = 'Quicksand',
    this.textAlign = TextAlign.center,
    this.isFittedBox = true
  });

  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;

    final textWidget = Text(
        textContent,
        textAlign:textAlign,
        style:TextStyle(
            fontSize: fontSize * curScaleFactor,
            fontWeight: fontWeight,
            color:fontColor,
            fontFamily: fontFamily
        )
    );

    return isFittedBox != false ? FittedBox(
      child: textWidget
    ) : textWidget;
  }
}
