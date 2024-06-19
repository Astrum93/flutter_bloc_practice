import 'package:bloc_practice/bloc/counter_cubit.dart';
import 'package:bloc_practice/screen/bloc_practice_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const BlocPractice());
}

class BlocPractice extends StatelessWidget {
  const BlocPractice({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => CounterCubit(),
        child: const BlocPracticeScreen(),
      ),
    );
  }
}
