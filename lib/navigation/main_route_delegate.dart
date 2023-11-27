import 'package:flutter/material.dart';
import 'package:navigation2/navigation/navigation_stack_item.dart';
import 'navigation_stack_manager.dart';

class MainRouterDelegate extends RouterDelegate<NavStackItem>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final NavigationStackManager stack;

  MainRouterDelegate({
    required this.stack,
  }) : super() {
    stack.addListener(notifyListeners);
  }

  @override
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  void dispose() {
    stack.removeListener(notifyListeners);
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
    stack.pop();
    return true;
  }

  List<Page> _buildPageStack() => stack.pages.map((e) => e.page).toList();

  @override
  Future<void> setNewRoutePath(NavStackItem configuration) async {
    stack.clearAndPush(configuration.path);
  }

  @override
  NavStackItem get currentConfiguration => stack.currentState;
}
