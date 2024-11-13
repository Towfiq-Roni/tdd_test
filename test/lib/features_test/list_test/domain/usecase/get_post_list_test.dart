import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_test/features/list/data/model/post_list_model.dart';
import 'package:tdd_test/features/list/domain/entity/post_list_entity.dart';
import 'package:tdd_test/features/list/domain/repository/list_repository.dart';
import 'package:tdd_test/features/list/domain/usecase/get_post_list.dart';

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

    test('pass test', () async {
      final file = File(
          '/home/towfiq/AndroidStudioProjects/tdd_test/test/lib/features_test/list_test/data/response/mock_pass_post_response.json');
      final PostListEntity json =
          PostListModel.fromJson(jsonDecode(await (file.readAsString())));
      when(repository.getPosts()).thenAnswer((_) async => json);
      final getPosts = await useCase();
      final expected = json;
      // final expected = PostListModel.fromJson(json);
      expect(getPosts, expected);
    });

    test('empty test', () async {
      final file = File(
          '/home/towfiq/AndroidStudioProjects/tdd_test/test/lib/features_test/list_test/data/response/mock_empty_post_response.json');
      final json =
          PostListModel.fromJson(jsonDecode(await (file.readAsString())));
      when(repository.getPosts()).thenAnswer((_) async => json);
      final getPosts = await useCase();
      // final expected = PostListModel.fromJson(json);
      final expected = json;
      expect(getPosts, expected);
    });

    test('fail test', () async {
      final passFile = File(
          '/home/towfiq/AndroidStudioProjects/tdd_test/test/lib/features_test/list_test/data/response/mock_pass_post_response.json');
      final passJson =
          PostListModel.fromJson(jsonDecode(await (passFile.readAsString())));
      final failFile = File(
          '/home/towfiq/AndroidStudioProjects/tdd_test/test/lib/features_test/list_test/data/response/mock_fail_post_response.json');
      final failJson =
          PostListModel.fromJson(jsonDecode(await (failFile.readAsString())));
      when(repository.getPosts()).thenAnswer((_) async => failJson);
      final getPosts = await useCase();
      // final expected = PostListModel.fromJson(passJson);
      final expected = passJson;
      expect(getPosts, isNot(expected));
    });
  });
}
