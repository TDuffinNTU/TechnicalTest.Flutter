/// Parse the response of an API Request (List of dynamic) into an object's
/// fromJson() method.
List<T> parseListResponse<T>(
  List<dynamic> data,
  T Function(Map<String, dynamic>) fromJson,
) {
  List<T> result = [];
  for (final item in data) {
    result.add(fromJson(item as Map<String, dynamic>));
  }
  return result;
}
