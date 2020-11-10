import 'package:flutter/material.dart';

class GradientPainter extends CustomPainter {
  GradientPainter({this.gradient, this.strokeWidth, this.borderRadius});

  final Gradient gradient;
  final double strokeWidth;
  final double borderRadius;
  final Paint paintObject = Paint();
  
  @override 
  void paint(Canvas canvas, Size size) {
    Rect innerRect = Rect.fromLTRB(strokeWidth, strokeWidth, size.width - strokeWidth, size.height - strokeWidth);
    RRect innerRounderRect = RRect.fromRectAndRadius(innerRect, Radius.circular(borderRadius));
    
    Rect outerRect = Offset.zero & size;
    RRect outerRounderRect = RRect.fromRectAndRadius(outerRect, Radius.circular(borderRadius));

    paintObject.shader = gradient.createShader(outerRect);
    Path borderPath = _calculateBorderPath(outerRounderRect,innerRounderRect);
    canvas.drawPath(borderPath, paintObject);
  }

  Path _calculateBorderPath(RRect outerRect, RRect innerRect){
    Path outerRectPath = Path() ..addRRect(outerRect);
    Path innerRectPath = Path() ..addRRect(innerRect);
    return Path.combine(PathOperation.difference, outerRectPath, innerRectPath);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate ) => true;
}

class GradientBorderButtonContainer extends StatelessWidget {

  GradientBorderButtonContainer({
    @required gradient,
    @required this.child,
    this.strokeWidth = 4, this.onPressed,
    this.borderRadius = 64,
    this.padding = 16,
    splashColor = Colors.red
  }) : this.painter = GradientPainter(
      gradient: gradient, strokeWidth: strokeWidth,borderRadius: borderRadius
  );

  final GradientPainter painter;
  final Widget child;
  final VoidCallback onPressed;
  final double strokeWidth;
  final double borderRadius;
  final double padding;
  final Color splashColor = Colors.lightBlue.withOpacity(0.25);

  @override
  Widget build(BuildContext context) {

    return CustomPaint(
      painter:painter,
      child:InkWell(
        highlightColor:Colors.transparent,
        splashColor:splashColor,
        borderRadius: BorderRadius.circular(borderRadius),
        onTap:onPressed,
        child:Container(
          padding:EdgeInsets.symmetric(vertical: padding + strokeWidth, horizontal: padding + strokeWidth + 15),
          child:child
        )
      )
    );
  }
}







