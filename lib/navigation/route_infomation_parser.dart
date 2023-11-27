import 'dart:async';
import 'package:navigation2/navigation/navigation_stack_item.dart';
import 'navigation_stack_manager.dart';
import 'package:flutter/material.dart';

class UrlHandlerInformationParser extends RouteInformationParser<NavStackItem> {
  final NavigationStackManager stack;

  UrlHandlerInformationParser(this.stack);

  @override
  Future<NavStackItem> parseRouteInformation(
      RouteInformation routeInformation) async {
    final pathSegments = routeInformation.uri.pathSegments;

    if (pathSegments.isEmpty) {
      return stack.route(path: stack.initialRoutes);
    } else {
      if (stack.routeOrNull(path: "/${pathSegments.first}") != null) {
        return stack.route(path: "/${pathSegments.first}");
      } else {
        return stack.route(path: stack.initialRoutes);
      }
    }
  }

  @override
  RouteInformation restoreRouteInformation(NavStackItem configuration) {
    return RouteInformation(uri: Uri.parse(configuration.path));
  }
}
