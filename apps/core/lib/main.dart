import 'package:core/dependency_injection/inject.dart';
import 'package:core/router/go_router.dart';
import 'package:flutter/material.dart';

void main() {
  registerService();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
