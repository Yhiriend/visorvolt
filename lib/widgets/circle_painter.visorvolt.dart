import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  final Color color;

  CirclePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 10;

    final path = Path()
      ..moveTo(0, size.height) // Bottom Left
      ..lineTo(size.width, size.height) // Bottom Right
      ..lineTo(size.width, size.height * 1 / 2)
      ..lineTo(size.width, size.height * 1 / 2) // Top Right
      ..arcToPoint(
        Offset(0, size.height * 1 / 2), // Top Left
        radius: Radius.circular(size.width), // Radio para el arco
        clockwise: false, // Sentido antihorario
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
