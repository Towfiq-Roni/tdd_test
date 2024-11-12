import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_test/features/list/domain/repository/list_repository.dart';
import 'package:tdd_test/features/list/domain/usecase/get_post_list.dart';

class MockListRepository extends Mock implements ListRepository {}

void main() {
  group('post list usecase ', () {
    late ListRepository repository;
    late GetPostList useCase;

    setUp(() {
      repository = MockListRepository();
      useCase = GetPostList(repository);
    });

    test('pass test', () {});

    test('empty test', () {});

    test('fail test', () {});
  });
}
