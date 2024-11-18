import 'package:tdd_test/app/configs/app_config.dart';

part 'authentication_api_urls.dart';

class ApiUrl implements AuthenticationApiUrls {
  var baseUrl = appConfig.getApiClientConfig().baseUrl;

  @override
  String get getPostList => '${baseUrl}posts';
}

final ApiUrl apiUrl = ApiUrl();
