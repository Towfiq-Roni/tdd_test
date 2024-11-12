import 'dart:async';

import 'package:tdd_test/core/data/data_export.dart';
import 'package:tdd_test/features/list/data/datasource/list_http_datasource/list_http_datasource.dart';

class ListHttpDataSourceImpl extends HttpDatasource
    implements ListHttpDataSource {
  ListHttpDataSourceImpl(super.client);

  @override
  FutureOr<dynamic> getPosts() async {
    try {
      var getPost = await client.invokeApi(apiUrl.getPostList, HTTPType.get);
      // var getData = PostListModel.fromJson(getPost);
      return getPost;
    } on Exception catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
