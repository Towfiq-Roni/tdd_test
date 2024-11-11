import 'package:tdd_test/features/authentication/domain/entity/post_list_entity.dart';

abstract class AuthenticationRepository {
  Future<PostListEntity> getPosts();
}
