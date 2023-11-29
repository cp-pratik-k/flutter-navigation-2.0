import 'package:flutter/material.dart';
import 'package:navigation2/navigation/models/route.dart';
import 'navigation_stack_manager.dart';

class MainRouterDelegate extends RouterDelegate<NavRoute>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final NavRouter router;

  MainRouterDelegate({
    required this.router,
  }) : super() {
    router.addListener(notifyListeners);
  }

  @override
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  void dispose() {
    router.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey, pages: _buildPageStack(), onPopPage: _onPopPage);
  }

  bool _onPopPage(Route route, dynamic result) {
    if (!route.didPop(result)) {
      return false;
    }
    router.pop();
    return true;
  }

  List<Page> _buildPageStack() => router.pages
      .map((route) => route.page(route.state, UniqueKey()))
      .toList();

  @override
  Future<void> setNewRoutePath(NavRoute configuration) async {
    if (configuration.path != router.currentState.path) {
      router.push(path: configuration.path(configuration.state.pathParam));
    }
  }

  @override
  NavRoute get currentConfiguration => router.currentState;
}
