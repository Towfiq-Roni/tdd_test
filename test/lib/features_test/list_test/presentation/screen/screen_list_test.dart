import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_test/app/configs/app_config.dart';
import 'package:tdd_test/core/domain/domain_export.dart';
import 'package:tdd_test/features/list/data/model/post_list_model.dart';
import 'package:tdd_test/features/list/presentation/bloc/list_bloc.dart';
import 'package:tdd_test/main.dart';

@GenerateMocks([ListBloc])
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('list screen ', () {
    // late ListBloc mockListBloc;
    setUp(() async {
      // mockListBloc = MockListBloc();
      await dotenv.load();
      // appConfig.loadData(dotenv.env);
      // ServiceLocator().init(appConfig: appConfig);
    });

    testWidgets('list item test', (WidgetTester tester) async {
      appConfig.loadData(dotenv.env);
      ServiceLocator().init(appConfig: appConfig);
      WidgetsFlutterBinding.ensureInitialized();
      when(() => const ListState()).thenAnswerWithList();
      await tester.pumpWidget(const AppBlocProvider());
      await tester.tap(find.byKey(const Key('navigate_list_key')));
      await tester.pumpAndSettle(
        const Duration(seconds: 2),
      );
      expect(find.byKey(const Key('post_list')), findsOneWidget);
    });

    testWidgets('item tap test', (WidgetTester tester) async {
      WidgetsFlutterBinding.ensureInitialized();
      when(() => const ListState()).thenAnswerWithList();
      await tester.pumpWidget(const AppBlocProvider());
      await tester.tap(find.byKey(const Key('navigate_list_key')));
      await tester.pumpAndSettle(
        const Duration(seconds: 2),
      );
      await tester.tap(find.byKey(const Key('')));
      expect(find.byKey(const Key('post_list')), findsOneWidget);
    });

    testWidgets('navigation test', (WidgetTester tester) async {});
  });
}

extension on PostExpectation<ListState Function()> {
  ListState thenAnswerWithList({List<PostListModel>? listItem}) {
    return ListState(postList: listItem);
  }
}
