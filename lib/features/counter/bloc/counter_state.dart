part of 'counter_bloc.dart';

@immutable
sealed class CounterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CounterInitialState extends CounterState {}

class CounterUpdateState extends CounterState {
  final int counter;

  CounterUpdateState(this.counter);

  @override
  List<Object?> get props => [counter];
}

class CounterErrorState extends CounterState {
  final String message;

  CounterErrorState(this.message);

  @override
  List<Object?> get props => [message];
}