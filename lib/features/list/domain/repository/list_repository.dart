import 'package:tdd_test/features/list/domain/entity/post_list_entity.dart';

abstract class ListRepository {
  Future<PostListEntity> getPosts();
}
