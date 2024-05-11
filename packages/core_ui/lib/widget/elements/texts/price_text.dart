import 'package:flutter/material.dart';

class PriceText extends StatelessWidget{
  const PriceText({super.key, required this.title, this.color});

  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        color: color ?? Colors.black,
        fontWeight: FontWeight.w800,
        fontSize: 12,
      ),
    );
  }
}
