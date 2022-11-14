import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final VoidCallback onPressed;
  const CircleButton({
    super.key,
    required this.icon,
    required this.iconSize,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      child: IconButton(
        icon: Icon(
          icon,
          size: iconSize,
          color: Colors.black,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
