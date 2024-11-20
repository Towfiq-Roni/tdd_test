import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_test/app/configs/app_config.dart';
import 'package:tdd_test/core/domain/dependency_injection/service_locator.dart';
import 'package:tdd_test/features/counter/bloc/counter_bloc.dart';
import 'package:tdd_test/features/list/presentation/screen/screen_list.dart';
import 'package:tdd_test/main.dart';

// class MockCounterBloc extends MockBloc<CounterEvent, CounterState>
//     implements CounterBloc {}

@GenerateMocks([CounterBloc])
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Counter navigation test', () {
    late CounterBloc counterBloc;

    setUp(() async {
      counterBloc = CounterBloc();
      await dotenv.load();
      appConfig.loadData(dotenv.env);
      ServiceLocator().init(appConfig: appConfig);
    });

    testWidgets('Navigation success test', (WidgetTester tester) async {
      WidgetsFlutterBinding.ensureInitialized();
      when(() => const CounterState()).thenAnswerWithVoid();

      await tester.pumpWidget(const AppBlocProvider());
      await tester.tap(find.byKey(const Key('navigate_list_key')));

      await tester.pumpAndSettle(
        const Duration(seconds: 2),
      );

      expect(find.byType(ListScreen), findsOneWidget);
    });

    // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    //   when(() => counterBloc.state).thenReturn(const CounterState());
    //   whenListen(
    //     counterBloc,
    //     Stream<CounterState>.fromIterable(
    //       [
    //         CounterInitialState(),
    //         const CounterUpdateState(1),
    //       ],
    //     ),
    //   );
    //   await tester.pumpWidget(
    //     BlocProvider<CounterBloc>(
    //       create: (c) => counterBloc,
    //       child: const MyApp(),
    //     ),
    //   );
    //
    //   await tester.tap(find.byKey(const Key('increment_key')));
    //   await tester.pump();
    //
    //   expect(find.text('1'), findsOneWidget);
    // });

    // testWidgets('Counter decrements smoke test', (WidgetTester tester) async {
    //   when(() => counterBloc.state).thenReturn(const CounterState());
    //   whenListen(
    //     counterBloc,
    //     Stream<CounterState>.fromIterable(
    //       [
    //         // CounterInitialState(),
    //         const CounterUpdateState(-1),
    //       ],
    //     ),
    //   );
    //   await tester.pumpWidget(
    //     BlocProvider<CounterBloc>(
    //       create: (c) => counterBloc,
    //       child: const MyApp(),
    //     ),
    //   );
    //
    //   await tester.tap(find.byKey(const Key('decrement_key')));
    //   await tester.pump();
    //
    //   expect(find.text('-1'), findsOneWidget);
    // });
  });
}

extension on When<CounterState> {
  CounterState thenAnswerWithVoid() {
    return CounterInitialState();
  }
}
