import 'package:flutter/material.dart';
import 'package:navigation2/screens/home_screen.dart';
import 'package:navigation2/screens/like_screen.dart';
import 'package:navigation2/screens/search_screen.dart';
import 'package:navigation2/screens/settings_screen.dart';
import 'navigation/navigation_stack_item.dart';
import 'navigation/navigation_stack_manager.dart';

NavigationStackManager stackManager =
    NavigationStackManager(initialRoutePath: "/home", routes: const [
  NavStackItem(
      name: AppPage.home,
      path: AppRoutePaths.home,
      page: MaterialPage(key: ValueKey('home'), child: HomePage())),
  NavStackItem(
      name: AppPage.like,
      path: AppRoutePaths.like,
      page: MaterialPage(key: ValueKey('like'), child: Like())),
  NavStackItem(
      name: AppPage.search,
      path: AppRoutePaths.search,
      page: MaterialPage(key: ValueKey('search'), child: Search())),
  NavStackItem(
      name: AppPage.settings,
      path: AppRoutePaths.settings,
      page: MaterialPage(key: ValueKey('settings'), child: Settings())),
]);

enum AppPage { home, settings, like, search, other }

class AppRoutePaths {
  static const home = "/home";
  static const like = "/like";
  static const settings = "/settings";
  static const search = "/search";
}
