import 'package:flutter/material.dart';
import 'package:atomino/utils/colors.dart';

// CAMPO DOS JOGADORES
class PlayerInput extends StatelessWidget {
  final String label;
  final Color color;
  final TextEditingController controller;

  const PlayerInput({
    super.key,
    required this.label,
    required this.color,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(width: 5, height: 16, color: color),
            const SizedBox(width: 9),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 13,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(width: 9),
            const Text(
              'PLAYER',
              style: TextStyle(color: muted, fontSize: 10, letterSpacing: 1),
            ),
          ],
        ),

        const SizedBox(height: 9),

        TextField(
          controller: controller,
          style: const TextStyle(color: white, fontSize: 14),
          cursorColor: color,
          decoration: InputDecoration(
            hintText: 'Digite o seu nome',
            hintStyle: const TextStyle(color: muted, fontSize: 13),
            filled: true,
            fillColor: const Color(0xFF101E32),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 15,
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: Color(0xFF405574), width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: color, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
