import 'package:tdd_test/features/list/data/model/post_list_model.dart';

abstract class ListRepository {
  Future<List<PostListModel>> getPosts();
}
