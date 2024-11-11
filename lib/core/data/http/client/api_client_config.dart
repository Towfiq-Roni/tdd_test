class ApiClientConfig {
  final String baseUrl;
  final String portalBaseUrl;
  final String paymentBaseUrl;
  final String apiVersion;
  final String blogUrl;
  final bool isDebug;

  ApiClientConfig(
      {required this.baseUrl,
      required this.blogUrl,
      required this.portalBaseUrl,
      required this.paymentBaseUrl,
      required this.isDebug,
      required this.apiVersion});

  bool get isNotDebug {
    return !isDebug;
  }
}
