part of 'list_bloc.dart';

sealed class ListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetListEvent extends ListEvent {}

class NavigateToHome extends ListEvent {}
