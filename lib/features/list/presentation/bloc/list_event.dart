part of 'list_bloc.dart';

sealed class ListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetListEvent extends ListEvent {}

class NavigateToHomeEvent extends ListEvent {
  final PostListModel? postModel;

  NavigateToHomeEvent({this.postModel});

  @override
  List<Object?> get props => [postModel];
}
