import 'package:flutter/material.dart';
import 'package:navigation2/navigation/route_infomation_parser.dart';
import 'app_back_button_dispatcher.dart';
import 'main_route_delegate.dart';
import 'navigation_stack_item.dart';

class NavigationStackManager extends ChangeNotifier
    implements RouterConfig<NavStackItem> {
  final List<NavStackItem> routes;
  late String initialRoutes;

  NavigationStackManager({
    String initialRoutePath = "/",
    required this.routes,
  }) {
    initialRoutes = initialRoutePath;
    _pages.add(route(path: initialRoutePath));
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

  NavStackItem? routeOrNull({required String path}) =>
      routes.where((element) => element.path == path).firstOrNull;

  NavStackItem route({required String path}) {
    final stackItem = routeOrNull(path: path);
    if (stackItem == null) {
      throw Exception("Provided path $path routes is not exist!");
    }
    return stackItem;
  }

  void push(String path) {
    _pages.add(route(path: path));
    notifyListeners();
  }

  void clearAndPush(String path) {
    _pages.clear();
    _pages.add(route(path: path));
    notifyListeners();
  }

  bool canPop() => _pages.length > 1;

  void pop() {
    if (canPop()) {
      _pages.removeLast();
      notifyListeners();
    }
  }

  @override
  BackButtonDispatcher? get backButtonDispatcher =>
      AppBackButtonDispatcher(this);

  @override
  RouteInformationParser<NavStackItem>? get routeInformationParser =>
      UrlHandlerInformationParser(this);

  @override
  RouteInformationProvider? get routeInformationProvider => null;

  @override
  RouterDelegate<NavStackItem> get routerDelegate =>
      MainRouterDelegate(stack: this);
}
