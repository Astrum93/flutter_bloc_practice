import 'package:bloc_practice/screen/bloc_practice_screen.dart';
import 'package:bloc_practice/screen/counter/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BlocPracticeApp extends StatelessWidget {
  const BlocPracticeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  routes: [
    /// Home 화면
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const BlocPracticeScreen();
      },
      routes: [
        GoRoute(
          path: 'counter',
          builder: (context, state) {
            return const CounterScreen();
          },
        )
      ],
    )
  ],
);