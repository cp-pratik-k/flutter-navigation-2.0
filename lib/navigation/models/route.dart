import 'package:flutter/cupertino.dart' show LocalKey, Page;
import 'package:navigation2/navigation/models/route_state.dart';

class NavRoute<T> {
  final String Function(Map<String, String> pathParam) path;
  final String name;
  final Page Function(NavRouteState state, LocalKey? pageKey) page;
  final NavRouteState<T> state;

  const NavRoute(
      {required this.name,
      required this.path,
      required this.page,
      this.state = const NavRouteState()});

  NavRoute copyWith({
    String Function(Map<String, String> pathParam)? path,
    NavRouteState? state,
  }) =>
      NavRoute(
          name: name,
          path: path ?? this.path,
          page: page,
          state: state ?? this.state);

  @override
  bool operator ==(Object other) {
    return other is NavRoute &&
        runtimeType == other.runtimeType &&
        path == other.path &&
        name == other.name &&
        page == other.page;
  }

  @override
  int get hashCode => path.hashCode ^ name.hashCode ^ page.hashCode;
}
