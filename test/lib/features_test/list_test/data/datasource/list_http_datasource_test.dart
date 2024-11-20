import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_test/app/configs/app_config.dart';
// import 'package:mocktail/mocktail.dart';
import 'package:tdd_test/core/data/data_export.dart';
import 'package:tdd_test/core/domain/domain_export.dart';
import 'package:tdd_test/features/list/data/datasource/list_http_datasource/list_http_datasource_impl.dart';

import '../../../../core/data/http/client/mock_api_client.dart';
import '../response/get_mock_response.dart';

void main() {
  group('post list GET api call ', () {
    late ListHttpDataSourceImpl dataSource;
    late ApiClient mockApiClient;

    setUp(() async {
      mockApiClient = MockApiClient();
      dataSource = ListHttpDataSourceImpl(mockApiClient);
      await dotenv.load();
      // appConfig.loadData(dotenv.env);
      // ServiceLocator().init(appConfig: appConfig);
    });

    test('pass test', () async {
      appConfig.loadData(dotenv.env);
      ServiceLocator().init(appConfig: appConfig);
      final file = File(GetMockResponse.passJsonFile);
      final json = jsonDecode(await (file.readAsString()));
      when(mockApiClient.invokeApi(apiUrl.getPostList, HTTPType.get))
          .thenAnswer((_) => json);
      final getPosts = await dataSource.getPosts();
      final expected = json;
      expect(getPosts, expected);
    });

    test('empty test', () async {
      final file = File(GetMockResponse.emptyJsonFile);
      final json = jsonDecode(await (file.readAsString()));
      when(mockApiClient.invokeApi(apiUrl.getPostList, HTTPType.get))
          .thenAnswer((_) => json);
      final getPosts = await dataSource.getPosts();
      final expected = json;
      expect(getPosts, expected);
    });

    test('fail test', () async {
      final passFile = File(GetMockResponse.passJsonFile);
      final passJson = jsonDecode(await (passFile.readAsString()));
      final failFile = File(GetMockResponse.failJsonFile);
      final failJson = jsonDecode(await (failFile.readAsString()));
      when(mockApiClient.invokeApi(apiUrl.getPostList, HTTPType.get))
          .thenAnswer((_) => failJson);
      final getPosts = await dataSource.getPosts();
      final expected = passJson;
      expect(getPosts, isNot(expected));
    });
  });
}
