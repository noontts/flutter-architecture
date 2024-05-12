import 'package:core_ui/theme/color/theme_color.dart';
import 'package:core_ui/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeNavbar extends ConsumerWidget {
  const HomeNavbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.read(appThemeProvider.notifier);
    final themeProvider = ref.watch(appThemeProvider);

    return Container(
      color: themeProvider.themeColor.backgroundPrimary,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(
              children: [SizedBox()],
            ),
            Row(
              children: [
                IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.search,
                      color: themeProvider.themeColor.text,
                    )),
                IconButton(
                    onPressed: () {
                      themeNotifier.switchTheme();
                    },
                    icon: Icon(
                      themeProvider.themeColor == darkTheme
                          ? Icons.dark_mode
                          : Icons.light_mode,
                      color: themeProvider.themeColor.text,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
