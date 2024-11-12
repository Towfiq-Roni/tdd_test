import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_test/features/list/data/datasource/list_http_datasource/list_http_datasource.dart';
import 'package:tdd_test/features/list/data/model/post_list_model.dart';
import 'package:tdd_test/features/list/data/repository/list_repository_impl.dart';

class MockListHttpDataSource extends Mock implements ListHttpDataSource {}

void main() {
  group('post list repository ', () {
    late ListHttpDataSource dataSource;
    late ListRepositoryImpl repository;

    setUp(() {
      dataSource = MockListHttpDataSource();
      repository = ListRepositoryImpl(dataSource);
    });

    test('pass test', () async {
      final file = File(
          '/home/towfiq/AndroidStudioProjects/tdd_test/test/lib/features_test/list_test/data/response/mock_pass_post_response.json');
      final json = jsonDecode(await (file.readAsString()));
      when(dataSource.getPosts()).thenAnswer((_) => json);
      // when(mockApiClient.invokeApi(apiUrl.getPostList, HTTPType.get))
      //     .thenAnswer((_) => json);
      final getPosts = await repository.getPosts();
      final expected = PostListModel.fromJson(json);
      expect(getPosts, expected);
    });

    test('empty test', () async {
      final file = File(
          '/home/towfiq/AndroidStudioProjects/tdd_test/test/lib/features_test/list_test/data/response/mock_empty_post_response.json');
      final json = jsonDecode(await (file.readAsString()));
      when(dataSource.getPosts()).thenAnswer((_) => json);
      final getPosts = await repository.getPosts();
      final expected = PostListModel.fromJson(json);
      expect(getPosts, expected);
    });

    test('fail test', () async {
      final passFile = File(
          '/home/towfiq/AndroidStudioProjects/tdd_test/test/lib/features_test/list_test/data/response/mock_pass_post_response.json');
      final passJson = jsonDecode(await (passFile.readAsString()));
      final failFile = File(
          '/home/towfiq/AndroidStudioProjects/tdd_test/test/lib/features_test/list_test/data/response/mock_fail_post_response.json');
      final failJson = jsonDecode(await (failFile.readAsString()));
      when(dataSource.getPosts()).thenAnswer((_) => failJson);
      final getPosts = await repository.getPosts();
      final expected = PostListModel.fromJson(passJson);
      expect(getPosts, isNot(expected));
    });
  });
}
