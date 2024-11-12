import 'dart:async';

abstract class ListHttpDataSource {
  FutureOr<dynamic> getPosts();
}
