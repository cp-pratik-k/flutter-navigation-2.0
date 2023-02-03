import 'package:flutter/material.dart';
import 'navigation_stack_item.dart';

class NavigationStackManager extends ChangeNotifier {
  NavigationStackManager._(){
    _pages.add(const NavStackItem(name: AppPage.home, path: AppRoutePaths.home));
  }

  static final NavigationStackManager object = NavigationStackManager._();



  List<NavStackItem> _pages = [];

  List<NavStackItem> get pages => _pages;

  NavStackItem get currentState => _pages.last;

  NavStackItem get previousState =>
      _pages.elementAt(_pages.indexOf(_pages.last) - 1);

  void updateStack(List<NavStackItem> newItems) {
    _pages = List.from(newItems);
    notifyListeners();
  }

  void push(NavStackItem item) {
    _pages.add(item);
    notifyListeners();
  }

  void clearAndPush(NavStackItem item) {
    _pages.clear();
    _pages.add(item);
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


