import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ScaffoldWithNestedNavigation(
      {super.key, required this.navigationShell});

  void _goBranch(int index) {
    navigationShell.goBranch(index,
        initialLocation: index == navigationShell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: navigationShell,
        bottomNavigationBar: Container(
          color: Colors.black,
          height: 70,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
            child: GNav(
              gap: 8,
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.grey.shade800,
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
