part 'authentication_api_urls.dart';

class ApiUrl implements AuthenticationApiUrls {
  var baseUrl = 'https://jsonplaceholder.typicode.com/';

  @override
  String get getPostList => '${baseUrl}posts';
}

final ApiUrl apiUrl = ApiUrl();
