import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitialState()) {
    on<IncrementCounter>(_onIncrementCounter);
    on<DecrementCounter>(_onDecrementCounter);
    on<ResetCounter>(_onResetCounter);
  }

  int count = 0;
  int get counter => count;

  void _onIncrementCounter(
      IncrementCounter event, Emitter<CounterState> emit) async {
    try {
      count++;
      emit(CounterUpdateState(count));
    } on Exception catch (e) {
      emit(CounterErrorState(e.toString()));
    }
  }

  void _onDecrementCounter(
      DecrementCounter event, Emitter<CounterState> emit) async {
    try {
      count--;
      emit(CounterUpdateState(count));
    } on Exception catch (e) {
      emit(CounterErrorState(e.toString()));
    }
  }

  void _onResetCounter(ResetCounter event, Emitter<CounterState> emit) async {
    try {
      count = 0;
      emit(CounterUpdateState(count));
    } on Exception catch (e) {
      emit(CounterErrorState(e.toString()));
    }
  }
}
