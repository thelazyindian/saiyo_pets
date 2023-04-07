abstract class INetwork {
  Future get({
    required String baseUri,
    String? path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  });

  Future post({
    required String baseUri,
    String? path,
    Object? data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  });
}
