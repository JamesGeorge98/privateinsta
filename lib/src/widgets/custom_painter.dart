import 'package:flutter/material.dart';

class GradientBorder extends CustomPainter {
  GradientBorder({required this.gradient, required this.sWidth,required this.bRadius});

  final Gradient gradient;
  final double sWidth;
  final Paint p = Paint();
  final double bRadius;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect innerRect = Rect.fromLTRB(
        sWidth, sWidth, size.width - sWidth, size.height - sWidth,);
    final Rect outerRect = Offset.zero & size;
    final RRect innerRoundedRect =
        RRect.fromRectAndRadius(innerRect, Radius.circular(bRadius));
    final RRect outerRoundedRect =
        RRect.fromRectAndRadius(outerRect, Radius.circular(bRadius));

    p.shader = gradient.createShader(outerRect);
    //Path borderPath = _calculateBorderPath(outerRect, innerRect);
    final Path borderPath = _calculateBorderPath(outerRoundedRect, innerRoundedRect);

    canvas.drawPath(borderPath, p);
  }

  Path _calculateBorderPath(RRect outerRect, RRect innerRect) {
    // Update parameters
    final Path outerRectPath = Path()..addRRect(outerRect);
    final Path innerRectPath = Path()..addRRect(innerRect);
    return Path.combine(PathOperation.difference, outerRectPath, innerRectPath);
  }

  // Path _calculateBorderPath(Rect outerRect, Rect innerRect) {
  //   Path outerRectPath = Path()..addRect(outerRect);
  //   Path innerRectPath = Path()..addRect(innerRect);
  //   return Path.combine(PathOperation.difference, outerRectPath, innerRectPath);
  // }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
