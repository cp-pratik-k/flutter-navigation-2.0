import 'package:flutter/cupertino.dart';

class NavStackItem {
  final Object? data;
  final String path;
  final AppPage name;
  final Page page;

  const NavStackItem(
      {required this.name, required this.path, this.data, required this.page});
}

enum AppPage {
  home,
  settings,
  like,
  search,
  other
}

class AppRoutePaths {
  static const home = "/home";
  static const like = "/like";
  static const settings = "/settings";
  static const search = "/search";
}
