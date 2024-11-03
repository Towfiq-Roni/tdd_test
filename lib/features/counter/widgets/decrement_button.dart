import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_test/features/counter/bloc/counter_bloc.dart';

class DecrementButton extends StatelessWidget {
  const DecrementButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return ElevatedButton(
          key: const Key('decrement_key'),
          onPressed: () {
            context.read<CounterBloc>().add(const DecrementCounter());
          },
          child: const Icon(
            Icons.exposure_minus_1,
            color: Colors.red,
            size: 24,
          ),
        );
      },
    );
  }
}
