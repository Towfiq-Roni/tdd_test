import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_test/features/list/data/datasource/list_http_datasource/list_http_datasource.dart';
import 'package:tdd_test/features/list/data/model/post_list_model.dart';
import 'package:tdd_test/features/list/data/repository/list_repository_impl.dart';

import '../../data/response/get_mock_response.dart';

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
      final file = File(GetMockResponse.passJsonFile);
      final dynamic json = await (file.readAsString());
      final decoded = jsonDecode(json);
      when(dataSource.getPosts()).thenReturn(decoded);
      final getPosts = await repository.getPosts();
      final expected = (decoded as List<dynamic>)
          .map((json) => PostListModel.fromJson(json))
          .toList();
      expect(getPosts, expected);
    });

    test('empty test', () async {
      final file = File(GetMockResponse.emptyJsonFile);
      final json = await (file.readAsString());
      final decoded = jsonDecode(json);
      when(dataSource.getPosts()).thenReturn(decoded);
      final getPosts = await repository.getPosts();
      final expected = (decoded as List<dynamic>)
          .map((json) => PostListModel.fromJson(json))
          .toList();
      expect(getPosts, expected);
    });

    test('fail test', () async {
      final passFile = File(GetMockResponse.passJsonFile);
      final passJson = await (passFile.readAsString());
      final decodedPass = jsonDecode(passJson);
      final failFile = File(GetMockResponse.failJsonFile);
      final failJson = await (failFile.readAsString());
      final failDecoded = jsonDecode(failJson);
      when(dataSource.getPosts()).thenAnswer((_) => failDecoded);
      final getPosts = await repository.getPosts();
      final expected = (decodedPass as List<dynamic>)
          .map((json) => PostListModel.fromJson(json))
          .toList();
      expect(getPosts, isNot(expected));
    });
  });
}
