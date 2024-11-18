import 'package:equatable/equatable.dart';

class PostListEntity extends Equatable {
  final List<PostEntity?>? postList;

  const PostListEntity({
    this.postList,
  });

  @override
  List<Object?> get props => [
        postList,
      ];
}

class PostEntity extends Equatable {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  const PostEntity({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  PostEntity emptyState() {
    return const PostEntity(
      userId: 0,
      id: 0,
      title: 'Empty',
      body: 'Empty',
    );
  }

  @override
  List<Object?> get props => [
        userId,
        id,
        title,
        body,
      ];
}
