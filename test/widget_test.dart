import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_test/features/counter/bloc/counter_bloc.dart';
import 'package:tdd_test/features/homepage/presentation/screen/screen_homepage.dart';
import 'package:tdd_test/main.dart';

class TestCounterBloc extends MockBloc<CounterEvent, CounterState>
    implements CounterBloc {}

void main() {
  group('Counter test', () {
    late CounterBloc counterBloc;
    setUp(() {
      counterBloc = TestCounterBloc();
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

    testWidgets('Navigation success test', (WidgetTester tester) async {
      when(() => counterBloc.state).thenReturn(const CounterState());
      await tester.pumpWidget(
        BlocProvider<CounterBloc>(
          create: (c) => counterBloc,
          child: const MyApp(),
        ),
      );

      await tester.tap(find.byKey(const Key('navigate_home_key')));
      await tester.pumpAndSettle();

      expect(find.byType(ScreenHomepage), findsOneWidget);
    });
  });
}
