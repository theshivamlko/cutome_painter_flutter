import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    print(size.width);
    print(size.height);

    Paint paint = Paint();
    paint.color = Colors.green;
    paint.style = PaintingStyle.fill;

    Paint paint2 = Paint();
    paint2.color = Colors.deepOrange;
    paint2.style = PaintingStyle.fill;

    Path path = Path();
    // starting point
    path.moveTo(0, 20);

    // Shape is divided into sections
    // path with curve
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    // path with curve
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);

    // Arc like lower half semi circle
    path.arcToPoint(
      Offset(size.width * 0.60, 20),
      radius: const Radius.circular(10),
      clockwise: false,
    );

    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    // canvas.drawPaint(paint);
    canvas.drawShadow(path, Colors.grey, 5, true);
    canvas.drawPath(path, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
