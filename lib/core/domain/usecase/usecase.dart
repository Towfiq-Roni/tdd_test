import 'dart:async';

abstract class UseCaseWithParams<Type, Params> {
  const UseCaseWithParams();
  FutureOr<Type?> call(Params params);
}

abstract class UseCaseWithoutParams<Type> {
  const UseCaseWithoutParams();
  FutureOr<Type?> call();
}
