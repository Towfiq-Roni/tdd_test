import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
// import 'package:mocktail/mocktail.dart';
import 'package:tdd_test/core/data/data_export.dart';
import 'package:tdd_test/features/list/data/datasource/list_http_datasource/list_http_datasource_impl.dart';

import '../../../../core/data/http/client/mock_api_client.dart';

void main() {
  group('post list GET api call ', () {
    late ListHttpDataSourceImpl dataSource;
    late ApiClient mockApiClient;

    setUp(() {
      mockApiClient = MockApiClient();
      dataSource = ListHttpDataSourceImpl(mockApiClient);
    });

    test('pass test', () async {
      final file = File(
          '/home/towfiq/AndroidStudioProjects/tdd_test/test/lib/features_test/list_test/data/response/mock_pass_post_response.json');
      final json = jsonDecode(await (file.readAsString()));
      when(mockApiClient.invokeApi(apiUrl.getPostList, HTTPType.get))
          .thenAnswer((_) => json);
      final getPosts = await dataSource.getPosts();
      final expected = json;
      expect(getPosts, expected);
    });

    test('empty test', () async {
      final file = File(
          '/home/towfiq/AndroidStudioProjects/tdd_test/test/lib/features_test/list_test/data/response/mock_empty_post_response.json');
      final json = jsonDecode(await (file.readAsString()));
      when(mockApiClient.invokeApi(apiUrl.getPostList, HTTPType.get))
          .thenAnswer((_) => json);
      final getPosts = await dataSource.getPosts();
      final expected = json;
      expect(getPosts, expected);
    });

    test('fail test', () async {
      final passFile = File(
          '/home/towfiq/AndroidStudioProjects/tdd_test/test/lib/features_test/list_test/data/response/mock_pass_post_response.json');
      final passJson = jsonDecode(await (passFile.readAsString()));
      final failFile = File(
          '/home/towfiq/AndroidStudioProjects/tdd_test/test/lib/features_test/list_test/data/response/mock_fail_post_response.json');
      final failJson = jsonDecode(await (failFile.readAsString()));
      when(mockApiClient.invokeApi(apiUrl.getPostList, HTTPType.get))
          .thenAnswer((_) => failJson);
      final getPosts = await dataSource.getPosts();
      final expected = passJson;
      expect(getPosts, isNot(expected));
    });
  });
}
