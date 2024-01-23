import 'package:flutter_bloc/flutter_bloc.dart';

// it can be a abstract class
sealed class CounterEvent {}

//event
final class CounterIncremented extends CounterEvent {}

final class CounterDecremented extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncremented>((event, emit) {
      emit(state + 1);
    });

    on<CounterDecremented>((event, emit) {
      if (state == 0) {
        return;
      }
      emit(state - 1);
    });
  }
}
