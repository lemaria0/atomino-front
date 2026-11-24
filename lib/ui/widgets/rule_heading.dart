import 'package:flutter/material.dart';

class RuleHeading extends StatelessWidget {
  final String title;

  const RuleHeading({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Color(0xFFFFC247),
        fontSize: 21,
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
      ),
    );
  }
}
