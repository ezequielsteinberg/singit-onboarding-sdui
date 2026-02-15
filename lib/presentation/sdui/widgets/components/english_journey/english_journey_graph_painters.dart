import 'package:flutter/material.dart';

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.withOpacity(0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final step = size.height / 4;
    for (int i = 0; i <= 4; i++) {
      final y = step * i;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class GraphPainter extends CustomPainter {
  final double progress;
  final Color color;

  GraphPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    if (progress == 0) return;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(0, size.height * 0.8);

    final p1 = Offset(size.width * 0.25, size.height * 0.65);
    final p2 = Offset(size.width * 0.6, size.height * 0.45);
    final end = Offset(size.width, size.height * 0.15);

    final c1 = Offset(size.width * 0.1, size.height * 0.8);
    final c2 = Offset(size.width * 0.15, size.height * 0.65);

    final c3 = Offset(size.width * 0.4, size.height * 0.65);
    final c4 = Offset(size.width * 0.45, size.height * 0.45);

    final c5 = Offset(size.width * 0.8, size.height * 0.45);
    final c6 = Offset(size.width * 0.85, size.height * 0.15);

    path.cubicTo(c1.dx, c1.dy, c2.dx, c2.dy, p1.dx, p1.dy);
    path.cubicTo(c3.dx, c3.dy, c4.dx, c4.dy, p2.dx, p2.dy);
    path.cubicTo(c5.dx, c5.dy, c6.dx, c6.dy, end.dx, end.dy);

    final pathMetrics = path.computeMetrics();
    for (var metric in pathMetrics) {
      final extractPath = metric.extractPath(0.0, metric.length * progress);
      canvas.drawPath(extractPath, paint);

      if (progress > 0.05) {
        final shaderPath = Path.from(extractPath);
        shaderPath.lineTo(extractPath.getBounds().right, size.height);
        shaderPath.lineTo(0, size.height);
        shaderPath.close();

        final gradientPaint = Paint()
          ..shader = LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [color.withOpacity(0.4), color.withOpacity(0.0)],
          ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

        canvas.drawPath(shaderPath, gradientPaint);
      }
    }

    final fillPaint = Paint()..color = Colors.white;
    final strokePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    void drawPoint(Offset p, double threshold) {
      if (progress >= threshold) {
        canvas.drawCircle(p, 6, fillPaint);
        canvas.drawCircle(p, 6, strokePaint);
      }
    }

    drawPoint(p1, 0.35);
    drawPoint(p2, 0.7);
    drawPoint(end, 0.99);
  }

  @override
  bool shouldRepaint(covariant GraphPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}
