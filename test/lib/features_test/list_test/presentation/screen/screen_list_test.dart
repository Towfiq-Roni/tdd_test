import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_test/app/configs/app_config.dart';
import 'package:tdd_test/core/domain/domain_export.dart';
import 'package:tdd_test/features/homepage/presentation/screen/screen_homepage.dart';
import 'package:tdd_test/features/list/data/model/post_list_model.dart';
import 'package:tdd_test/features/list/presentation/bloc/list_bloc.dart';
import 'package:tdd_test/features/list/presentation/widget/post_list.dart';
import 'package:tdd_test/main.dart';

@GenerateMocks([ListBloc])
// class MockNavigationService extends Mock implements NavigationService {}

// class MockFunction extends Mock {
//   void call();
// }

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('list screen ', () {
    // late ListBloc mockListBloc;
    // late MockFunction mockFunction;
    // late NavigationService mockNavigation;
    late NavigatorObserver mockNavigator;
    setUp(() async {
      // mockListBloc = MockListBloc();
      await dotenv.load();
      // mockNavigation = MockNavigationService();
      mockNavigator = MockNavigatorObserver();
      // mockFunction = MockFunction();
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
      int tapped = 0;
      when(() => const ListState()).thenAnswerWithList();
      await tester.pumpWidget(const AppBlocProvider());
      await tester.tap(find.byKey(const Key('navigate_list_key')));
      await tester.pumpAndSettle(
        const Duration(seconds: 2),
      );
      await tester.ensureVisible(find.byKey(const Key('navigate_to_home[1]')));
      expect(find.byKey(const Key('navigate_to_home[1]')), findsOneWidget);
      await tester.tap(find.byKey(const Key('navigate_to_home[1]')));
      await tester.pumpAndSettle(
        const Duration(seconds: 2),
      );
      tapped = IncreaseTap().tap;
      expect(tapped, 1);
    });

    testWidgets('navigation test', (WidgetTester tester) async {
      WidgetsFlutterBinding.ensureInitialized();
      when(() => const ListState()).thenAnswerWithList();
      await tester.pumpWidget(const AppBlocProvider());
      await tester.tap(find.byKey(const Key('navigate_list_key')));
      await tester.pumpAndSettle(
        const Duration(seconds: 5),
      );
      expect(find.byKey(const Key('navigate_to_home[1]')), findsOneWidget);
      await tester.tap(find.byKey(const Key('navigate_to_home[1]')));
      await tester.pumpAndSettle(
        const Duration(seconds: 2),
      );
      expect(find.byType(ScreenHomepage), findsOneWidget);
      expect(find.byKey(const Key('post_item')), findsOneWidget);
    });
  });
}

extension on PostExpectation<dynamic Function()> {
  dynamic thenReturnWithFunction(int tapped) {
    return tapped++;
  }
}

Future<dynamic> increaseTap(int tap) async {
  tap++;
}

extension on PostExpectation<ListState Function()> {
  ListState thenAnswerWithList({List<PostListModel>? listItem}) {
    return ListState(postList: listItem);
  }
}
