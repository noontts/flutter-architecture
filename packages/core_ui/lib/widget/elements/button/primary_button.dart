import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final Color? titleColor;

  const PrimaryButton({super.key, required this.title, this.titleColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
            shape: MaterialStatePropertyAll<OutlinedBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.zero))),
        onPressed: () {},
        child: Text(
          title,
          style: TextStyle(
            color: titleColor ?? Colors.black87,
          ),
        ));
  }
}
