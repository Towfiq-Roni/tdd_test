import 'package:tdd_test/features/authentication/data/datasource/authentication_http_datasource/authentication_http_datasource_impl.dart';
import 'package:tdd_test/features/authentication/domain/entity/post_list_entity.dart';
import 'package:tdd_test/features/authentication/domain/repository/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationHttpDataSourceImpl dataSourceImpl;

  AuthenticationRepositoryImpl(this.dataSourceImpl);

  @override
  Future<PostListEntity> getPosts() async {
    final getPost = await dataSourceImpl.getPosts();
    // final PostListEntity getData = PostListModel.fromJson(getPost);
    return getPost;
  }
}
