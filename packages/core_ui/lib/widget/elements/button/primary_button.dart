import 'package:core_ui/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PrimaryButton extends ConsumerWidget {
  final String title;
  final Color? titleColor;

  const PrimaryButton({super.key, required this.title, this.titleColor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeProvider = ref.watch(appThemeProvider).themeColor;

    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(
                themeProvider.backgroundPrimary),
            shape: const MaterialStatePropertyAll<OutlinedBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.zero))),
        onPressed: () {},
        child: Text(
          title,
          style: TextStyle(
            color: titleColor ?? themeProvider.text,
          ),
        ));
  }
}
