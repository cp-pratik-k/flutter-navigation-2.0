import 'package:flutter/material.dart';
import 'package:navigation2/navigation/models/route.dart';
import 'package:navigation2/navigation/models/route_state.dart';
import 'package:navigation2/navigation/route_infomation_parser.dart';
import 'app_back_button_dispatcher.dart';
import 'main_route_delegate.dart';

class NavRouter extends ChangeNotifier implements RouterConfig<NavRoute> {
  final List<NavRoute> routes;
  late String initialRoutes;

  NavRouter({
    String initialRoutePath = "/",
    required this.routes,
  }) {
    initialRoutes = initialRoutePath;
    _routesStack.add(route(path: initialRoutePath));
  }

  List<NavRoute> _routesStack = [];

  List<NavRoute> get pages => _routesStack;

  NavRoute get currentState => _routesStack.last;

  NavRoute get previousState =>
      _routesStack.elementAt(_routesStack.indexOf(_routesStack.last) - 1);

  //Route based functions
  void updateRoutes(List<NavRoute> newItems) {
    _routesStack = List.from(newItems);
    notifyListeners();
  }

  NavRoute? routeOrNull({required String path}) => routes
      .where((route) => route.path(route.state.pathParam) == path)
      .firstOrNull;

  NavRoute? namedRouteOrNull({required String name}) =>
      routes.where((route) => route.name == name).firstOrNull;

  NavRoute route({required String path}) {
    final stackItem = routeOrNull(path: path);
    if (stackItem == null) {
      throw Exception("Provided path $path routes is not exist!");
    }
    return stackItem;
  }

  NavRoute namedRoute({required String name}) {
    final route = namedRouteOrNull(name: name);
    if (route == null) {
      throw Exception("Provided $name named routes is not exist!");
    }
    return route;
  }

  //Path based navigation functions
  void push({required String path, NavRouteState? state}) {
    _routesStack.add(route(path: path).copyWith(state: state));
    notifyListeners();
  }

  void clearAndPush({required String path, NavRouteState? state}) {
    _routesStack.clear();
    _routesStack.add(route(path: path).copyWith(state: state));
    notifyListeners();
  }

  void replace({required String path, NavRouteState? state}) {
    _routesStack.removeLast();
    _routesStack.add(route(path: path).copyWith(state: state));
    notifyListeners();
  }

  //Name based navigation functions
  void pushNamed({required String name, NavRouteState? state}) {
    _routesStack.add(namedRoute(name: name).copyWith(state: state));
    notifyListeners();
  }

  void clearAndPushNamed({required String name, NavRouteState? state}) {
    _routesStack.clear();
    _routesStack.add(namedRoute(name: name).copyWith(state: state));
    notifyListeners();
  }

  void replaceNamed({required String name, NavRouteState? state}) {
    _routesStack.removeLast();
    _routesStack.add(namedRoute(name: name).copyWith(state: state));
    notifyListeners();
  }

  bool canPop() => _routesStack.length > 1;

  void pop() {
    if (canPop()) {
      _routesStack.removeLast();
      notifyListeners();
    }
  }

  @override
  BackButtonDispatcher? get backButtonDispatcher =>
      AppBackButtonDispatcher(this);

  @override
  RouteInformationParser<NavRoute>? get routeInformationParser =>
      UrlHandlerInformationParser(this);

  @override
  RouteInformationProvider? get routeInformationProvider => null;

  @override
  RouterDelegate<NavRoute> get routerDelegate =>
      MainRouterDelegate(router: this);
}
