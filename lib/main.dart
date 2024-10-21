import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_test/core/domain/dependency_injection/service_locator.dart';
import 'package:tdd_test/features/counter/bloc/counter_bloc.dart';
import 'package:tdd_test/features/counter/screen/screen_counter.dart';

void main() {
  ServiceLocator().init();
  runApp(const AppBlocProvider());
}

class AppBlocProvider extends StatefulWidget {
  const AppBlocProvider({super.key});
  @override
  State<AppBlocProvider> createState() => _AppBlocProviderState();
}

class _AppBlocProviderState extends State<AppBlocProvider> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocator<CounterBloc>(),
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CounterPage(),
    );
  }
}
