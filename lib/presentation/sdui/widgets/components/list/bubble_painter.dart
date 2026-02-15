import 'package:flutter/material.dart';

class BubblePainter extends CustomPainter {
  final Color color;
  final Color borderColor;
  final Color shadowColor;

  BubblePainter({
    required this.color,
    required this.borderColor,
    required this.shadowColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final shadowPaint = Paint()
      ..color = shadowColor
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

    const tailWidth = 12.0;
    const tailHeight = 12.0;
    const radius = 16.0;

    final path = Path();

    final h = size.height;
    final w = size.width;

    path.moveTo(tailWidth + radius, 0);
    path.lineTo(w - radius, 0);
    path.quadraticBezierTo(w, 0, w, radius);
    path.lineTo(w, h - radius);
    path.quadraticBezierTo(w, h, w - radius, h);
    path.lineTo(tailWidth + radius, h);
    path.quadraticBezierTo(tailWidth, h, tailWidth, h - radius);

    final centerY = h / 2;
    path.lineTo(tailWidth, centerY + (tailHeight / 2));

    path.lineTo(0, centerY);

    path.lineTo(tailWidth, centerY - (tailHeight / 2));

    path.lineTo(tailWidth, radius);
    path.quadraticBezierTo(tailWidth, 0, tailWidth + radius, 0);

    path.close();

    canvas.drawPath(path, shadowPaint);

    canvas.drawPath(path, paint);

    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
