abstract class BaseCache {
  Future<void> put(String key, String value, Duration duration);

  Future<void> forever(String key, String value);

  Future<String?> get(String key);

  Future<bool> has(String key);

  Future<bool> doesNotHave(String key);

  Future<bool> isExpired(String key);

  Future<void> remove(String key);

  Future<void> removeMultiple(RegExp keyPattern);

  Future<void> flushAll();

  Future<DateTime?> lastCachedAt();
}
