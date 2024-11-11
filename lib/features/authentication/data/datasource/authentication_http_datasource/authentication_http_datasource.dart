import 'dart:async';

abstract class AuthenticationHttpDataSource {
  FutureOr<dynamic> getPosts();
}
