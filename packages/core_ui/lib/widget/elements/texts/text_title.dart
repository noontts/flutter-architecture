import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  const TextTitle({super.key, required this.title, this.color});

  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color ?? Colors.black87,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
