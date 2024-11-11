import 'package:tdd_test/features/authentication/data/datasource/authentication_http_datasource/authentication_http_datasource.dart';
import 'package:tdd_test/features/authentication/data/model/post_list_model.dart';
import 'package:tdd_test/features/authentication/domain/entity/post_list_entity.dart';
import 'package:tdd_test/features/authentication/domain/repository/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationHttpDataSource dataSource;

  AuthenticationRepositoryImpl(this.dataSource);

  @override
  Future<PostListEntity> getPosts() async {
    final getPost = await dataSource.getPosts();
    final PostListEntity getData = PostListModel.fromJson(getPost);
    return getData;
  }
}
