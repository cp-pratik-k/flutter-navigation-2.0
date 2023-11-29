class NavRouteState<T> {
  final T? data;
  final Map<String, String> pathParam;
  final Map<String, String> queryParam;

  const NavRouteState({
    this.data,
    this.pathParam = const {},
    this.queryParam = const {},
  });

  @override
  bool operator ==(Object other) {
    return other is NavRouteState &&
        runtimeType == other.runtimeType &&
        data == other.data &&
        pathParam == other.pathParam &&
        queryParam == other.queryParam;
  }

  @override
  int get hashCode => data.hashCode ^ pathParam.hashCode ^ queryParam.hashCode;
}
