import 'package:flutter/material.dart';
import 'navigation_stack_manager.dart';

class AppBackButtonDispatcher extends RootBackButtonDispatcher {
  final NavRouter _navigationStackManager;

  AppBackButtonDispatcher(this._navigationStackManager);

  @override
  Future<bool> didPopRoute() {
    if (_navigationStackManager.pages.length > 1) {
      _navigationStackManager.pop();
      return Future.value(true);
    }
    return super.didPopRoute();
  }
}