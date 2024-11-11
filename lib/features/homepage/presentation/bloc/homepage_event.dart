part of 'homepage_bloc.dart';

abstract class HomepageEvent extends Equatable {
  const HomepageEvent();
  @override
  List<Object?> get props => [];
}

class GetItemValueEvent extends HomepageEvent {
  final int itemValue;

  const GetItemValueEvent({required this.itemValue});

  @override
  List<Object?> get props => [itemValue];
}

class NavigateEvent extends HomepageEvent {}
