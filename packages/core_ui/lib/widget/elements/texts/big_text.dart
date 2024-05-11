import 'package:flutter/material.dart';

class BigText extends StatelessWidget{
  const BigText({super.key, required this.title, this.color});

  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'Bebas Neue',
        color: color ?? Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 50,
      ),
    );
  }
}
