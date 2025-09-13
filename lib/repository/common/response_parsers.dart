/// Parse the response of an API request to a list of Objects using their
/// [fromJson] methods.
List<T> parseListResponse<T>(
  Map<String, dynamic> data,
  T Function(Map<String, dynamic>) fromJson,
) => (data['data'] as List<dynamic>).map((e) => fromJson(e)).toList();

/// Parse the response of an API request to an Object's [fromJson] method.
T parseSingleResponse<T>(
  Map<String, dynamic> data,
  T Function(Map<String, dynamic>) fromJson,
) {
  return fromJson(data['data']);
}
