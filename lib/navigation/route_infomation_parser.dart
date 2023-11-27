import 'dart:async';
import 'navigation_stack_manager.dart';
import 'package:flutter/material.dart';
import 'navigation_stack_item.dart';

class UrlHandlerInformationParser
    extends RouteInformationParser<NavigationStackManager> {
  final NavigationStackManager stack;

  UrlHandlerInformationParser(this.stack);

  @override
  Future<NavigationStackManager> parseRouteInformation(
      RouteInformation routeInformation) async {
    final pathSegments = routeInformation.uri.pathSegments;

    if (pathSegments.isEmpty) {
      return stack..clearAndPush(stack.initialRoutes);
    } else {
      if (stack.getRouteFromPath(path: "/${pathSegments.first}") != null) {
        return stack..clearAndPush("/${pathSegments.first}");
      } else {
        return stack..clearAndPush(stack.initialRoutes);
      }
    }
  }

  @override
  RouteInformation restoreRouteInformation(
      NavigationStackManager configuration) {
    return RouteInformation(uri: Uri.parse(configuration.currentState.path));
  }
}
