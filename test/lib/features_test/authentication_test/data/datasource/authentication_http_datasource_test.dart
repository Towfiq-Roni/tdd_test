import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
// import 'package:mocktail/mocktail.dart';
import 'package:tdd_test/core/data/data_export.dart';
import 'package:tdd_test/features/authentication/data/datasource/authentication_http_datasource/authentication_http_datasource_impl.dart';
import 'package:tdd_test/features/authentication/data/model/post_list_model.dart';

import '../../../../core/data/http/client/mock_api_client.dart';

void main() {
  group('post list test', () {
    late AuthenticationHttpDataSourceImpl dataSource;
    late ApiClient mockApiClient;

    setUp(() {
      mockApiClient = MockApiClient();
      dataSource = AuthenticationHttpDataSourceImpl(mockApiClient);
    });

    test('post GET api call pass test', () async {
      final file = File(
          '/home/towfiq/AndroidStudioProjects/tdd_test/test/lib/features_test/authentication_test/data/response/mock_pass_post_response.json');
      final json = jsonDecode(await (file.readAsString()));
      when(mockApiClient.invokeApi(apiUrl.getPostList, HTTPType.get))
          .thenAnswer((_) => json);
      final getPosts = await dataSource.getPosts();
      final expected = PostListModel.fromJson(json);
      expect(getPosts, expected);
    });

    test('post GET api call empty test', () async {
      when(mockApiClient.invokeApi(apiUrl.getPostList, HTTPType.get))
          .thenAnswer((_) => []);
      expect([], isEmpty);
    });

    test('post GET api call fail test', () async {
      final passFile = File(
          '/home/towfiq/AndroidStudioProjects/tdd_test/test/lib/features_test/authentication_test/data/response/mock_pass_post_response.json');
      final passJson = jsonDecode(await (passFile.readAsString()));
      final failFile = File(
          '/home/towfiq/AndroidStudioProjects/tdd_test/test/lib/features_test/authentication_test/data/response/mock_fail_post_response.json');
      final failJson = jsonDecode(await (failFile.readAsString()));
      when(mockApiClient.invokeApi(apiUrl.getPostList, HTTPType.get))
          .thenAnswer((_) => failJson);
      final getPosts = await dataSource.getPosts();
      final expected = PostListModel.fromJson(passJson);
      expect(getPosts, isNot(expected));
    });
  });
}
