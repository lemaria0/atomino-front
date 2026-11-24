import 'package:flutter/material.dart';
import 'package:atomino/utils/colors.dart';

// TEXTURA DA TELA
class ScreenTexturePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pixelPaint = Paint()
      ..color = const Color(0xFF344B6C).withOpacity(0.17);

    // Pequenos pontos de pixel
    for (double x = 18; x < size.width; x += 38) {
      for (double y = 18; y < size.height; y += 38) {
        canvas.drawRect(Rect.fromLTWH(x, y, 2, 2), pixelPaint);
      }
    }

    // Linhas sutis de monitor
    final linePaint = Paint()
      ..color = Colors.white.withOpacity(0.018)
      ..strokeWidth = 1;

    for (double y = 0; y < size.height; y += 5) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), linePaint);
    }

    // Pequenos detalhes nos cantos
    final cornerPaint = Paint()
      ..color = border
      ..strokeWidth = 3;

    const length = 18.0;

    // Superior esquerdo
    canvas.drawLine(const Offset(0, 0), const Offset(length, 0), cornerPaint);
    canvas.drawLine(const Offset(0, 0), const Offset(0, length), cornerPaint);

    // Superior direito
    canvas.drawLine(
      Offset(size.width, 0),
      Offset(size.width - length, 0),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(size.width, 0),
      Offset(size.width, length),
      cornerPaint,
    );

    // Inferior esquerdo
    canvas.drawLine(
      Offset(0, size.height),
      Offset(length, size.height),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(0, size.height),
      Offset(0, size.height - length),
      cornerPaint,
    );

    // Inferior direito
    canvas.drawLine(
      Offset(size.width, size.height),
      Offset(size.width - length, size.height),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(size.width, size.height),
      Offset(size.width, size.height - length),
      cornerPaint,
    );
  }

  @override
  bool shouldRepaint(covariant ScreenTexturePainter oldDelegate) => false;
}
