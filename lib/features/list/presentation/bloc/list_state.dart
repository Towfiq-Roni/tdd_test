part of 'list_bloc.dart';

class ListState extends Equatable {
  final StateStatus status;
  final String? message;
  final List<PostListModel>? postList;

  const ListState({
    this.status = StateStatus.initial,
    this.message,
    this.postList,
  });

  ListState copyWith({
    StateStatus? status,
    String? message,
    List<PostListModel>? postList,
  }) {
    return ListState(
      status: status ?? this.status,
      message: message ?? this.message,
      postList: postList ?? this.postList,
    );
  }

  @override
  List<Object?> get props => [
        status,
        message,
        postList,
      ];

  StateStatus get initialState => StateStatus.initial;
}
