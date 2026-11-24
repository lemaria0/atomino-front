import 'package:flutter/material.dart';
import 'package:atomino/utils/colors.dart';

// LOGO
class LogoAtomo extends StatelessWidget {
  const LogoAtomo({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [('At', cyan), ('O', yellow), ('Mn', coral), ('I', green), ('O', yellow)];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: SizedBox(
            width: 68,
            height: 74,
            child: CustomPaint(
              painter: HexagonPainter(item.$2),
              child: Center(
                child: Text(
                  item.$1,
                  style: TextStyle(
                    color: item.$2,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

// HEXÁGONOS
class HexagonPainter extends CustomPainter {
  final Color color;

  HexagonPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(size.width / 2, 2)
      ..lineTo(size.width - 2, size.height / 4)
      ..lineTo(size.width - 2, size.height * 3 / 4)
      ..lineTo(size.width / 2, size.height - 2)
      ..lineTo(2, size.height * 3 / 4)
      ..lineTo(2, size.height / 4)
      ..close();

    // PREENCHIMENTO ESCURO
    canvas.drawPath(
      path,
      Paint()
        ..color = color.withOpacity(0.06)
        ..style = PaintingStyle.fill,
    );

    // CONTORNO
    canvas.drawPath(
      path,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.5,
    );
  }

  @override
  bool shouldRepaint(covariant HexagonPainter oldDelegate) => false;
}
