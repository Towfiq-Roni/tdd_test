import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_test/features/counter/bloc/counter_bloc.dart';

void main() {
  group('Counter change', () {
    test('test when state is initial',
        () => expect(CounterBloc().state, CounterInitialState()));
    // blocTest<CounterBloc, CounterState>(
    //   'emits fail CounterUpdate when IncrementCounter is added.',
    //   build: () => CounterBloc(),
    //   act: (bloc) => bloc.add(const IncrementCounter()),
    //   expect: () => <CounterState>[CounterUpdateState(0)],
    //   verify: (bloc) => expect(bloc.state, CounterUpdateState(0)),
    // );
    blocTest<CounterBloc, CounterState>(
      'test when counter increment succeeds',
      build: () => CounterBloc(),
      act: (bloc) => bloc.add(const IncrementCounter()),
      expect: () => <CounterUpdateState>[CounterUpdateState(1)],
      verify: (bloc) => expect(bloc.state, CounterUpdateState(1)),
    );
    // blocTest<CounterBloc, CounterState>('test when counter decrement fails',
    //     build: () => CounterBloc(),
    //   act: (bloc) => bloc.add(const DecrementCounter()),
    //   expect: () => <CounterState>[CounterUpdateState(1)],
    //   verify: (bloc) => expect(bloc.state, CounterUpdateState(1)),
    // );
    blocTest<CounterBloc, CounterState>(
      'test when counter decrement succeeds',
      build: () => CounterBloc(),
      act: (bloc) => bloc.add(const DecrementCounter()),
      expect: () => <CounterUpdateState>[CounterUpdateState(-1)],
      verify: (bloc) => expect(bloc.state, CounterUpdateState(-1)),
    );
    // blocTest<CounterBloc, CounterState>('test when counter reset fails',
    //     build: () => CounterBloc(),
    //   act: (bloc) => bloc.add(const IncrementCounter()),
    //   expect: () => <CounterState>[CounterUpdateState(1)],
    //   verify: (bloc) => expect(bloc.state, CounterUpdateState(1)),
    // );
    blocTest<CounterBloc, CounterState>(
      'test when counter reset succeeds',
      build: () => CounterBloc(),
      act: (bloc) => bloc.add(const ResetCounter()),
      expect: () => <CounterUpdateState>[CounterUpdateState(0)],
      verify: (bloc) => expect(bloc.state, CounterUpdateState(0)),
    );
  });
}
