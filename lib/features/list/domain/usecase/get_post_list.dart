import 'dart:async';

import 'package:tdd_test/core/domain/usecase/usecase.dart';
import 'package:tdd_test/features/list/data/model/post_list_model.dart';
import 'package:tdd_test/features/list/domain/repository/list_repository.dart';

class GetPostList extends UseCaseWithoutParams<List<PostListModel>> {
  final ListRepository repository;

  GetPostList(this.repository);

  @override
  FutureOr<List<PostListModel>?> call() async {
    try {
      var list = await repository.getPosts();
      return list;
    } on Exception catch (e) {
      return null;
    }
  }
}
