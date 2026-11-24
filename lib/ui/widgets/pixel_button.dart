import 'package:flutter/material.dart';
import 'package:atomino/utils/colors.dart';

// BOTÃO PIXELADO DE AJUDA
class PixelButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;

  const PixelButton({super.key, required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: panel,
            border: Border.all(color: cyan, width: 2),
            boxShadow: const [
              BoxShadow(color: Colors.black38, offset: Offset(3, 3)),
            ],
          ),
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}
