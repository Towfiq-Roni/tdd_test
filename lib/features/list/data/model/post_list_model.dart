import '../../domain/entity/post_list_entity.dart';

class PostListModel extends PostListEntity {
  const PostListModel({
    super.postList,
  });

  factory PostListModel.fromJson(Map<String, dynamic> json) {
    List<PostEntity> data = <PostEntity>[];
    int i = 0;
    // for (int i = 0; i < 5; i++) {
    json['data'].forEach((v) {
      PostModel postModel = PostModel.fromJson(v);
      if (i < 5) {
        data.add(postModel);
        // break;
      }
      i++;
    });
    // data.add(PostModel.fromJson(json));
    // }
    return PostListModel(
      postList: data,
    );
  }

  @override
  List<Object?> get props => [
        postList,
      ];
}

class PostModel extends PostEntity {
  const PostModel({
    super.body,
    super.id,
    super.title,
    super.userId,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
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
