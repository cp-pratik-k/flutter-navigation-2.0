import 'package:flutter/cupertino.dart';

class NavStackItem {
  final Object? data;
  final String path;
  final dynamic name;
  final Page page;

  const NavStackItem(
      {required this.name, required this.path, this.data, required this.page});
}


