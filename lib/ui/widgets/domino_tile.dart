import 'package:flutter/material.dart';

class DominoTile extends StatelessWidget {
  final String left;
  final String right;
  final Color color;
  final Color shadowColor;

  const DominoTile({
    super.key,
    required this.left,
    required this.right,
    required this.color,
    required this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 145,
      height: 92,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: color.withOpacity(0.8),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                left,
                style: const TextStyle(
                  color: Color(0xFF17283A),
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          Container(
            width: 3,
            height: 55,
            color: const Color(0xFF334A40)
                .withOpacity(0.65),
          ),

          Expanded(
            child: Center(
              child: Text(
                right,
                style: const TextStyle(
                  color: Color(0xFF17283A),
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
