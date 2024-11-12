import 'package:tdd_test/core/domain/usecase/usecase.dart';
import 'package:tdd_test/features/list/domain/entity/post_list_entity.dart';
import 'package:tdd_test/features/list/domain/repository/list_repository.dart';

class GetPostList extends UseCaseWithoutParams<PostListEntity> {
  final ListRepository repository;

  GetPostList(this.repository);

  @override
  Future<PostListEntity> call() {
    return repository.getPosts();
  }
}
