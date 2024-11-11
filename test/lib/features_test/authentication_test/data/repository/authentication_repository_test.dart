import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_test/core/data/data_export.dart';
import 'package:tdd_test/features/authentication/data/datasource/authentication_http_datasource/authentication_http_datasource.dart';
import 'package:tdd_test/features/authentication/data/model/post_list_model.dart';
import 'package:tdd_test/features/authentication/data/repository/authentication_repository_impl.dart';

import '../../../../core/data/http/client/mock_api_client.dart';

class MockAuthenticationHttpDataSource extends Mock
    implements AuthenticationHttpDataSource {}

void main() {
  group('post list repository ', () {
    late AuthenticationHttpDataSource dataSource;
    late AuthenticationRepositoryImpl repository;
    late ApiClient mockApiClient;

    setUp(() {
      mockApiClient = MockApiClient();
      dataSource = MockAuthenticationHttpDataSource();
      repository = AuthenticationRepositoryImpl(dataSource);
    });

    test('pass test', () async {
      final file = File(
          '/home/towfiq/AndroidStudioProjects/tdd_test/test/lib/features_test/authentication_test/data/response/mock_pass_post_response.json');
      final json = jsonDecode(await (file.readAsString()));
      when(dataSource.getPosts()).thenAnswer((_) => json);
      // when(mockApiClient.invokeApi(apiUrl.getPostList, HTTPType.get))
      //     .thenAnswer((_) => json);
      final getPosts = await repository.getPosts();
      final expected = PostListModel.fromJson(json);
      expect(getPosts, expected);
    });

    test('empty test', () async {
      when(dataSource.getPosts()).thenAnswer((_) => []);
      expect([], isEmpty);
    });

    test('fail test', () async {
      final passFile = File(
          '/home/towfiq/AndroidStudioProjects/tdd_test/test/lib/features_test/authentication_test/data/response/mock_pass_post_response.json');
      final passJson = jsonDecode(await (passFile.readAsString()));
      final failFile = File(
          '/home/towfiq/AndroidStudioProjects/tdd_test/test/lib/features_test/authentication_test/data/response/mock_fail_post_response.json');
      final failJson = jsonDecode(await (failFile.readAsString()));
      when(dataSource.getPosts()).thenAnswer((_) => failJson);
      final getPosts = await dataSource.getPosts();
      final expected = PostListModel.fromJson(passJson);
      expect(getPosts, isNot(expected));
    });
  });
}
