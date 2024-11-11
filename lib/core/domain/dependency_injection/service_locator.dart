import 'package:get_it/get_it.dart';
import 'package:tdd_test/features/counter/bloc/counter_bloc.dart';

final serviceLocator = GetIt.instance;

class ServiceLocator {
  // static final ServiceLocator _instance = ServiceLocator._internal();

  // factory ServiceLocator() {
  //   return _instance;
  // }

  // ServiceLocator._internal();

  // final Map<Type, dynamic> _factories = {};

  // void register<T>(T instance) {
  //   _factories[T] = instance;
  // }

  void init() {
    _registerBloc();
  }

  void _registerBloc() {
    _counterBloc();
  }

  void _counterBloc() {
    serviceLocator.registerFactory<CounterBloc>(() => CounterBloc());
  }

  // static registerFactory<T extends Object>(object) {
  //   serviceLocator.registerFactory<T>(object);
  // }

  static T get<T extends Object>() {
    return serviceLocator.get<T>();
  }
}
