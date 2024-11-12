import 'package:tdd_test/features/list/data/datasource/list_http_datasource/list_http_datasource.dart';
import 'package:tdd_test/features/list/data/model/post_list_model.dart';
import 'package:tdd_test/features/list/domain/entity/post_list_entity.dart';
import 'package:tdd_test/features/list/domain/repository/list_repository.dart';

class ListRepositoryImpl implements ListRepository {
  final ListHttpDataSource dataSource;

  ListRepositoryImpl(this.dataSource);

  @override
  Future<PostListEntity> getPosts() async {
    final getPost = await dataSource.getPosts();
    final PostListEntity getData = PostListModel.fromJson(getPost);
    return getData;
  }
}
