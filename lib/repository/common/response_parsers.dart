List<T> parseListResponse<T>(List<dynamic> data, T Function(dynamic) fromJson) {
  List<T> result = [];
  for (final item in data) {
    result.add(fromJson(item));
  }
  return result;
}
