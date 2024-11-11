import '../client/api_client.dart';

abstract class HttpDatasource {
  final ApiClient client;
  HttpDatasource(this.client);
}
