/// Parse the response of an API Request (List of dynamic) into an object's
/// fromJson() method.
List<T> parseListResponse<T>(
  Map<String, dynamic> data,
  T Function(Map<String, dynamic>) fromJson,
) => (data['data'] as List<dynamic>).map((e) => fromJson(e)).toList();

T parseSingleResponse<T>(
  Map<String, dynamic> data,
  T Function(Map<String, dynamic>) fromJson,
) {
  return fromJson(data['data']);
}
