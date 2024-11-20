import 'dart:convert';

import 'package:tdd_test/features/list/data/datasource/list_http_datasource/list_http_datasource.dart';
import 'package:tdd_test/features/list/data/model/post_list_model.dart';
import 'package:tdd_test/features/list/domain/repository/list_repository.dart';

class ListRepositoryImpl implements ListRepository {
  final ListHttpDataSource dataSource;

  ListRepositoryImpl(this.dataSource);

  @override
  Future<List<PostListModel>> getPosts() async {
    final getPost = await dataSource.getPosts();
    // final PostListEntity getData = PostListModel.fromJson(getPost);
    final List<dynamic> jsonData = jsonDecode(getPost);
    final posts =
        (jsonData).map((json) => PostListModel.fromJson(json)).toList();
    return posts;
  }
}
