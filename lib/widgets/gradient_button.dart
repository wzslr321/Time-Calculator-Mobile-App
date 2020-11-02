import 'package:flutter/material.dart';

class GradientPainter extends CustomPainter {
  GradientPainter({this.gradient, this.strokeWidth});

  final Gradient gradient;
  final double strokeWidth;
  final Paint paintObject = Paint();
  
  @override 
  void paint(Canvas canvas, Size size) {
    Rect innerRect = Rect.fromLTRB(strokeWidth, strokeWidth, size.width - strokeWidth, size.height - strokeWidth);
    Rect outerRect = Offset.zero & size;

    paintObject.shader = gradient.createShader(outerRect);
    Path borderPath = _calculateBorderPath(outerRect,innerRect);
    canvas.drawPath(borderPath, paintObject);
  }

  Path _calculateBorderPath(Rect outerRect, Rect innerRect){
    Path outerRectPath = Path() ..addRect(outerRect);
    Path innerRectPath = Path() ..addRect(innerRect);
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
  }) : this.painter = GradientPainter(
      gradient: gradient, strokeWidth: strokeWidth
  );

  final GradientPainter painter;
  final Widget child;
  final VoidCallback onPressed;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter:painter,
      child:child
    );
  }
}
