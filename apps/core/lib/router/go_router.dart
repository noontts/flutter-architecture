import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:product/features/home/presentation/screen/home_screen.dart';
import 'package:product/features/home/presentation/screen/profile_screen.dart';
import 'package:product/features/home/presentation/screen/favorite_screen.dart';
import 'package:product/infrastructure/router/router.dart';

import '../layout/scaffold_with_nested_navigation.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellHome');
final _shellNavigatorProfileKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellProfile');
final _shellNavigatorSearchKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellSearch');

final router =
    GoRouter(initialLocation: '/', navigatorKey: _rootNavigatorKey, routes: [
  StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(navigatorKey: _shellNavigatorHomeKey, routes: [
          GoRoute(
              path: '/',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: MyHomePage()),
              routes: productRoutes
          ),
        ]),
        StatefulShellBranch(navigatorKey: _shellNavigatorProfileKey, routes: [
          GoRoute(
            path: '/profile',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ProfileScreen()),
          )
        ])
      ])
]);
