import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_test/app/configs/boot_config.dart';
import 'package:tdd_test/app/configs/boot_settings.dart';
import 'package:tdd_test/core/domain/dependency_injection/service_locator.dart';
import 'package:tdd_test/features/counter/bloc/counter_bloc.dart';
import 'package:tdd_test/features/counter/screen/screen_counter.dart';
import 'package:tdd_test/features/list/presentation/bloc/list_bloc.dart';
import 'package:tdd_test/res/routes/app_router.dart';
import 'package:tdd_test/services/navigation/navigation_service.dart';

void main() {
  bootstrap((BootSettings? bootSettings) {
    return const AppBlocProvider();
  });
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
        ),
        BlocProvider(
          create: (context) => serviceLocator<ListBloc>(),
        ),
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
      navigatorKey: NavigationService.navigatorKey,
      onGenerateRoute: AppRouter.generateRoute,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CounterPage(),
    );
  }
}
