import 'package:get_it/get_it.dart';
import 'package:tdd_test/app/configs/app_config.dart';
import 'package:tdd_test/core/data/cache/client/preference_cache.dart';
import 'package:tdd_test/core/data/data_export.dart';
import 'package:tdd_test/core/data/http/client/dio_client.dart';
import 'package:tdd_test/features/counter/bloc/counter_bloc.dart';
import 'package:tdd_test/features/list/data/datasource/list_http_datasource/list_http_datasource.dart';
import 'package:tdd_test/features/list/data/datasource/list_http_datasource/list_http_datasource_impl.dart';
import 'package:tdd_test/features/list/data/repository/list_repository_impl.dart';
import 'package:tdd_test/features/list/domain/repository/list_repository.dart';
import 'package:tdd_test/features/list/domain/usecase/get_post_list.dart';
import 'package:tdd_test/features/list/presentation/bloc/list_bloc.dart';

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

  void init({required AppConfig appConfig}) {
    _registerBase();
    _registerBloc();
    _registerUseCase();
    _registerRepository();
    _registerDataSource();
  }

  void _registerBase() {
    serviceLocator.registerSingleton<AppConfig>(appConfig);

    serviceLocator.registerFactory<ApiClientConfig>(() => ApiClientConfig(
          baseUrl: appConfig.apiBaseUrl,
          isDebug: appConfig.debug,
          apiVersion: appConfig.apiVersion,
        ));

    serviceLocator.registerFactory<DioClient>(() => DioClient());
    serviceLocator.get<DioClient>().setClient();

    serviceLocator
        .registerFactory<ApiClient>(() => ApiClientImpl(dioClient.getClient()));

    serviceLocator.registerFactory<BaseCache>(() => PreferenceCache());
  }

  void _registerBloc() {
    _counterBloc();
    _listBloc();
  }

  void _counterBloc() {
    serviceLocator.registerFactory<CounterBloc>(() => CounterBloc());
  }

  void _listBloc() {
    serviceLocator.registerFactory<ListBloc>(
        () => ListBloc(serviceLocator<GetPostList>()));
  }

  void _registerUseCase() {
    _getListUseCase();
  }

  void _getListUseCase() {
    serviceLocator.registerFactory<GetPostList>(
        () => GetPostList(serviceLocator<ListRepository>()));
  }

  void _registerRepository() {
    _registerListRepository();
  }

  void _registerListRepository() {
    serviceLocator.registerFactory<ListRepository>(
        () => ListRepositoryImpl(serviceLocator<ListHttpDataSource>()));
  }

  void _registerDataSource() {
    _registerListDataSource();
  }

  void _registerListDataSource() {
    serviceLocator.registerFactory<ListHttpDataSource>(
        () => ListHttpDataSourceImpl(serviceLocator<ApiClient>()));
  }

  // static registerFactory<T extends Object>(object) {
  //   serviceLocator.registerFactory<T>(object);
  // }

  static T get<T extends Object>() {
    return serviceLocator.get<T>();
  }
}
