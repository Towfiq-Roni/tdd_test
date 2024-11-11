import '../client/base_cache.dart';

abstract class CacheDatasource {
  final BaseCache cache;

  CacheDatasource(this.cache);
}
