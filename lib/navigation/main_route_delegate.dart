import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/like_screen.dart';
import '../screens/search_screen.dart';
import '../screens/settings_screen.dart';
import 'navigation_stack_item.dart';
import 'navigation_stack_manager.dart';

class MainRouterDelegate extends RouterDelegate<NavigationStackManager>
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
        key: navigatorKey, pages: _buildStack(), onPopPage: _onPopPage);
  }

  bool _onPopPage(Route route, dynamic result) {
    if (!route.didPop(result)) {
      return false;
    }
    stack.pop();
    return true;
  }

  List<Page> _buildStack() => stack.pages.map((e) {
        if (e.name == AppPage.settings) {
          return const MaterialPage(
              key: ValueKey("settings"), child: Settings());
        } else if (e.name == AppPage.like) {
          return const MaterialPage(key: ValueKey("like"), child: Like());
        } else if (e.name == AppPage.search) {
          return const MaterialPage(key: ValueKey("search"), child: Search());
        }
        return const MaterialPage(key: ValueKey("home"), child: HomePage());
      }).toList();

  @override
  Future<void> setNewRoutePath(NavigationStackManager configuration) async {}

  @override
  NavigationStackManager get currentConfiguration => stack;
}
