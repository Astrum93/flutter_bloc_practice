import 'package:bloc_practice/bloc/counter_cubit/counter_cubit.dart';
import 'package:bloc_practice/common/widget/width_height_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Page'),
        centerTitle: true,
      ),
      body: BlocBuilder<CounterCubit, dynamic>(
        builder: (context, count) => Center(
          child: Text(
            '$count',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'increment',
            child: const Icon(Icons.add),
            onPressed: () => context.read<CounterCubit>().increment(),
          ),
          height10,
          FloatingActionButton(
            heroTag: 'decrement',
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterCubit>().decrement(),
          ),
          height10,
          FloatingActionButton(
            heroTag: 'multiply',
            child: const Icon(Icons.close),
            onPressed: () => context.read<CounterCubit>().multiply(),
          ),
        ],
      ),
    );
  }
}
