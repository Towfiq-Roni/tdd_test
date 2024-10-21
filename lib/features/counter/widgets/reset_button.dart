import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_test/features/counter/bloc/counter_bloc.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            context.read<CounterBloc>().add(const ResetCounter());
          },
          child: const Icon(
            Icons.restore_sharp,
            color: Colors.black,
            size: 24,
          ),
        );
      },
    );
  }
}