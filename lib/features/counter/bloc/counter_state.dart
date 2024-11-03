part of 'counter_bloc.dart';

class CounterState extends Equatable {
  const CounterState();
  @override
  List<Object?> get props => [];
}

class CounterInitialState extends CounterState {}

class CounterUpdateState extends CounterState {
  final int counter;

  const CounterUpdateState(this.counter);

  @override
  List<Object?> get props => [counter];
}

class CounterErrorState extends CounterState {
  final String message;

  const CounterErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
