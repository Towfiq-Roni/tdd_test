part of 'list_bloc.dart';

class ListState extends Equatable {
  final StateStatus status;
  final String? message;
  final List<PostListModel>? postList;
  final PostListModel? postModel;

  const ListState({
    this.status = StateStatus.initial,
    this.message,
    this.postList,
    this.postModel,
  });

  ListState copyWith({
    StateStatus? status,
    String? message,
    List<PostListModel>? postList,
    PostListModel? postModel,
  }) {
    return ListState(
      status: status ?? this.status,
      message: message ?? this.message,
      postList: postList ?? this.postList,
      postModel: postModel ?? this.postModel,
    );
  }

  @override
  List<Object?> get props => [
        status,
        message,
        postList,
        postModel,
      ];

  StateStatus get initialState => StateStatus.initial;
}
