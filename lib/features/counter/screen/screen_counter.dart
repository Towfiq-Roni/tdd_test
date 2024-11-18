import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_test/features/counter/bloc/counter_bloc.dart';
import 'package:tdd_test/features/counter/widgets/decrement_button.dart';
import 'package:tdd_test/features/counter/widgets/increment_button.dart';
import 'package:tdd_test/features/counter/widgets/reset_button.dart';
import 'package:tdd_test/res/res_export.dart';
import 'package:tdd_test/services/navigation/navigation_service.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(context),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text('Counter'),
    );
  }

  Center buildBody(BuildContext context) {
    return Center(
      child: BlocBuilder<CounterBloc, CounterState>(
        builder: (blocContext, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (state is CounterInitialState) ...[
                const Text(
                  'Press the buttons to increment, decrement or reset the counter',
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
              ],
              if (state is CounterErrorState) ...[
                Text('An error occurred ${state.message}'),
                const SizedBox(height: 24),
              ],
              if (state is CounterUpdateState) ...[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${state.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 24),
              ],
              buildButtons(context),
              const SizedBox(height: 24),
              navigateToButton(context),
            ],
          );
        },
      ),
    );
  }

  Row buildButtons(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DecrementButton(),
        ResetButton(),
        IncrementButton(),
      ],
    );
  }

  ElevatedButton navigateToButton(BuildContext context) {
    return ElevatedButton(
      key: const Key('navigate_list_key'),
      onPressed: () {
        NavigationService.navigateTo(RoutePaths.listScreen);
      },
      child: const Text('Jump To List Screen'),
    );
  }
}
