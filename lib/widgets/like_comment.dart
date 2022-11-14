import 'package:flutter/material.dart';

import '../models/post_model.dart';

class LikeComment extends StatelessWidget {
  final String number;
  final IconData icon;

  final VoidCallback onPressed;
  const LikeComment({
    super.key,
    required this.number,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(icon),
          iconSize: 25.0,
          onPressed: onPressed,
        ),
        Text(
          number,
          style: TextStyle(color: Colors.grey[600]),
        ),
      ],
    );
  }
}
