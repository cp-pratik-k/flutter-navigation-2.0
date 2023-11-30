import 'package:flutter/material.dart';
import 'package:navigation2/screens/home_screen.dart';
import 'package:navigation2/screens/like_screen.dart';
import 'package:navigation2/screens/search_screen.dart';
import 'package:navigation2/screens/settings_screen.dart';
import 'navigation/models/route.dart';
import 'navigation/navigation_stack_manager.dart';

NavRouter router = NavRouter(initialRoutePath: AppRoutePaths.home, routes: [
  NavRoute(
      name: AppRouteNames.home,
      path: (pathParam) => AppRoutePaths.home,
      page: (state, pageKey) =>
          MaterialPage(key: pageKey, child: const HomePage())),
  NavRoute<String>(
      name: AppRouteNames.like,
      path: (pathParam) => AppRoutePaths.like,
      page: (state, pageKey) => MaterialPage(
          key: pageKey,
          child: Like(
            data: state.data,
          ))),
  NavRoute(
      name: AppRouteNames.search,
      path: (pathParam) => AppRoutePaths.search,
      page: (state, pageKey) =>
          MaterialPage(key: pageKey, child: const Search())),
  NavRoute(
      name: AppRouteNames.settings,
      path: (pathParam) => AppRoutePaths.settings,
      page: (state, pageKey) =>
          MaterialPage(key: pageKey, child: const Settings())),
]);

class AppRouteNames {
  static const home = "home";
  static const like = "like";
  static const settings = "settings";
  static const search = "search";
}

class AppRoutePaths {
  static const home = "/home";
  static const like = "/like";
  static const settings = "/settings";
  static const search = "/search";
}
