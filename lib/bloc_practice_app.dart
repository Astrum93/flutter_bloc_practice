import 'package:bloc_practice/screen/bloc_practice_screen.dart';
import 'package:flutter/material.dart';

class BlocPracticeApp extends StatelessWidget {
  const BlocPracticeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BlocPracticeScreen(),
    );
  }
}
