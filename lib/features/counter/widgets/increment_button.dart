import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_test/features/counter/bloc/counter_bloc.dart';

class IncrementButton extends StatelessWidget {
  const IncrementButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            context.read<CounterBloc>().add(const IncrementCounter());
          },
          child: const Icon(
            Icons.exposure_plus_1,
            color: Colors.green,
            size: 24,
          ),
        );
      },
    );
  }
}
