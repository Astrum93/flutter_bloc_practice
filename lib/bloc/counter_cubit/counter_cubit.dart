import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<dynamic> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);

  void multiply() => emit(state * state);
}
