import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:core_ui/theme/theme_provider.dart';

class ScaffoldWithNestedNavigation extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;

  const ScaffoldWithNestedNavigation(
      {super.key, required this.navigationShell});

  void _goBranch(int index) {
    navigationShell.goBranch(index,
        initialLocation: index == navigationShell.currentIndex);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeProvider = ref.watch(appThemeProvider);
    return Scaffold(
        body: navigationShell,
        bottomNavigationBar: Container(
          color: themeProvider.themeColor.backgroundPrimary,
          height: 70,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
            child: GNav(
              gap: 8,
              backgroundColor: themeProvider.themeColor.backgroundPrimary,
              color: themeProvider.themeColor.text,
              activeColor: Colors.white,
              tabBackgroundColor: themeProvider.themeColor.selectedItem,
              padding: const EdgeInsets.all(16),
              tabs: const [
                GButton(
                  icon: Icons.roofing_outlined,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.person_outline,
                  text: 'Profile',
                )
              ],
              onTabChange: (index) {
                _goBranch(index);
              },
            ),
          ),
        ));
  }
}
