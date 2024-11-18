import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_test/core/status/state_status.dart';
import 'package:tdd_test/features/list/data/model/post_list_model.dart';
import 'package:tdd_test/features/list/domain/entity/post_list_entity.dart';
import 'package:tdd_test/features/list/domain/usecase/get_post_list.dart';
import 'package:tdd_test/features/list/presentation/bloc/list_bloc.dart';

import 'list_bloc_test.mocks.dart';

@GenerateMocks([GetPostList])
void main() {
  group('get list bloc ', () {
    late GetPostList useCase;
    late ListBloc bloc;

    setUp(() {
      useCase = MockGetPostList();
      bloc = ListBloc(useCase);
    });

    test('initial state empty test', () {
      final expected = predicate<ListState>((state) =>
          state.status == StateStatus.initial &&
          state.postList == null &&
          state.message == null);
      expect(bloc.state, expected);
    });

    test('pass test', () async {
      final file = File(
          '/home/towfiq/AndroidStudioProjects/tdd_test/test/lib/features_test/list_test/data/response/mock_pass_post_response.json');
      final PostListEntity json =
          PostListModel.fromJson(jsonDecode(await (file.readAsString())));
      when(useCase()).thenAnswer((_) async => json);
      final expected = [
        predicate<ListState>((state) => state.status == StateStatus.loading),
        predicate<ListState>((state) =>
            state.status == StateStatus.loaded && state.postList == json),
      ];
      bloc.add(GetListEvent());
      expectLater(bloc.stream, emitsInOrder(expected));
    });

    test('fail test', () {
      when(useCase()).thenAnswer((_) => null);
      final expected = [
        predicate<ListState>((state) => state.status == StateStatus.loading),
        predicate<ListState>((state) =>
            state.status == StateStatus.error &&
            state.message == INVALID_MESSAGE),
      ];
      bloc.add(GetListEvent());
      expectLater(bloc.stream, emitsInOrder(expected));
    });
  });

  group('navigation to home ', () {
    test('navigated test', () {});

    test('not navigated test', () {});
  });
}
