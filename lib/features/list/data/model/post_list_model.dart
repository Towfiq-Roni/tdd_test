// class PostListModel extends PostListEntity {
//   const PostListModel({
//     super.postList,
//   });
//
//   factory PostListModel.fromJson(Map<String, dynamic> json) {
//     List<PostEntity> data = <PostEntity>[];
//     int i = 0;
//     // for (int i = 0; i < 5; i++) {
//     json['data'].forEach((v) {
//       PostModel postModel = PostModel.fromJson(v);
//       if (i < 5) {
//         data.add(postModel);
//         // break;
//       }
//       i++;
//     });
//     // data.add(PostModel.fromJson(json));
//     // }
//     return PostListModel(
//       postList: data,
//     );
//   }
//
//   @override
//   List<Object?> get props => [
//         postList,
//       ];
// }
//
// class PostModel extends PostEntity {
//   const PostModel({
//     super.body,
//     super.id,
//     super.title,
//     super.userId,
//   });
//
//   factory PostModel.fromJson(Map<String, dynamic> json) {
//     return PostModel(
//       userId: json['userId'],
//       id: json['id'],
//       title: json['title'],
//       body: json['body'],
//     );
//   }
//
//   @override
//   List<Object?> get props => [
//         userId,
//         id,
//         title,
//         body,
//       ];
// }

import 'package:equatable/equatable.dart';

class PostListModel extends Equatable {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostListModel({this.userId, this.id, this.title, this.body});

  factory PostListModel.fromJson(Map<String, dynamic> json) {
    return PostListModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }

  @override
  List<Object?> get props => [
        userId,
        id,
        title,
        body,
      ];
}
