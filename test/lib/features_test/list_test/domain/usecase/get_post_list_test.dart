import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_test/features/list/data/model/post_list_model.dart';
import 'package:tdd_test/features/list/domain/repository/list_repository.dart';
import 'package:tdd_test/features/list/domain/usecase/get_post_list.dart';

import '../../data/response/get_mock_response.dart';
import 'get_post_list_test.mocks.dart';

// class MockListRepository extends Mock implements ListRepository {}

@GenerateMocks([ListRepository])
void main() {
  group('post list usecase ', () {
    late ListRepository repository;
    late GetPostList useCase;

    setUp(() {
      repository = MockListRepository();
      useCase = GetPostList(repository);
    });

    test('pass usecase test', () async {
      final file = File(GetMockResponse.passJsonFile);
      final json = await file.readAsString();
      final decoded = jsonDecode(json);
      final List<PostListModel> passJson = (decoded as List<dynamic>)
          .map((json) => PostListModel.fromJson(json))
          .toList();
      when(repository.getPosts()).thenAnswer((_) async => passJson);
      final List<PostListModel>? getPosts = await useCase();
      final expected = passJson;
      // final expected = PostListModel.fromJson(json);
      expect(getPosts, expected);
    });

    test('empty usecase test', () async {
      final file = File(GetMockResponse.emptyJsonFile);
      final json = await file.readAsString();
      final decoded = jsonDecode(json);
      final dynamic passJson = (decoded as List<dynamic>)
          .map((json) => PostListModel.fromJson(json))
          .toList();
      when(repository.getPosts()).thenAnswer((_) async => passJson);
      final getPosts = await useCase();
      // final expected = PostListModel.fromJson(json);
      final expected = passJson;
      expect(getPosts, expected);
    });

    test('fail usecase test', () async {
      final passFile = File(GetMockResponse.passJsonFile);
      final passJson = await passFile.readAsString();
      final passDecoded = jsonDecode(passJson);
      final List<PostListModel> passData = (passDecoded as List<dynamic>)
          .map((json) => PostListModel.fromJson(json))
          .toList();
      final failFile = File(GetMockResponse.failJsonFile);
      final failJson = await failFile.readAsString();
      final failDecoded = jsonDecode(failJson);
      final List<PostListModel> failData = (failDecoded as List<dynamic>)
          .map((json) => PostListModel.fromJson(json))
          .toList();
      when(repository.getPosts()).thenAnswer((_) async => failData);
      final List<PostListModel>? getPosts = await useCase();
      final expected = passData;
      expect(getPosts, isNot(expected));
    });
  });
}
