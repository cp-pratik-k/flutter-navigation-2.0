import 'package:flutter/material.dart';
import 'navigation_stack_item.dart';

class NavigationStackManager extends ChangeNotifier {
  final List<NavStackItem> routes;
  late String initialRoutes;

  NavigationStackManager({
    String initialRoutePath = "/",
    required this.routes,
  }) {
    initialRoutes = initialRoutePath;
    _pages.add(_validRouteFromPath(path: initialRoutePath));
  }

  List<NavStackItem> _pages = [];

  List<NavStackItem> get pages => _pages;

  NavStackItem get currentState => _pages.last;

  NavStackItem get previousState =>
      _pages.elementAt(_pages.indexOf(_pages.last) - 1);

  void updateStack(List<NavStackItem> newItems) {
    _pages = List.from(newItems);
    notifyListeners();
  }

  NavStackItem? getRouteFromPath({required String path}) =>
      routes.where((element) => element.path == path).firstOrNull;

  NavStackItem _validRouteFromPath({required String path}) {
    final stackItem = getRouteFromPath(path: path);
    if (stackItem == null) {
      throw Exception("Provided path $path routes is not exist!");
    }
    return stackItem;
  }

  void push(String path) {
    _pages.add(_validRouteFromPath(path: path));
    notifyListeners();
  }

  void clearAndPush(String path) {
    _pages.clear();
    _pages.add(_validRouteFromPath(path: path));
    notifyListeners();
  }

  bool canPop() => _pages.length > 1;

  void pop() {
    if (canPop()) {
      _pages.removeLast();
      notifyListeners();
    }
  }
}
