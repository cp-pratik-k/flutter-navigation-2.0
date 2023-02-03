class NavStackItem {
  final Object? data;
  final String path;
  final AppPage name;

  const NavStackItem({required this.name, required this.path, this.data});
}

enum AppPage {
  home,
  settings,
  like,
  search,
}

class AppRoutePaths {
  static const home = "/home";
  static const like = "/like";
  static const settings = "/settings";
  static const search = "/search";
}

