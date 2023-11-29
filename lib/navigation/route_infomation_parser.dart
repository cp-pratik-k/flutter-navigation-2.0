import 'dart:async';
import 'package:navigation2/navigation/models/route.dart';
import 'package:flutter/material.dart';

import 'navigation_stack_manager.dart';

class UrlHandlerInformationParser extends RouteInformationParser<NavRoute> {
  final NavRouter router;

  UrlHandlerInformationParser(this.router);

  @override
  Future<NavRoute> parseRouteInformation(
      RouteInformation routeInformation) async {
    final pathSegments = routeInformation.uri.pathSegments;

    if (pathSegments.isEmpty) {
      return router.route(path: router.initialRoutes);
    } else {
      if (router.routeOrNull(path: "/${pathSegments.first}") != null) {
        return router.route(path: "/${pathSegments.first}");
      } else {
        return router.route(path: router.initialRoutes);
      }
    }
  }

  @override
  RouteInformation restoreRouteInformation(NavRoute configuration) {
    return RouteInformation(
        uri: Uri.parse(configuration.path(configuration.state.pathParam)));
  }
}
