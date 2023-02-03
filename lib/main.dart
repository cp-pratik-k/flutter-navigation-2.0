import 'package:flutter/material.dart';
import 'navigation/app_back_button_dispatcher.dart';
import 'navigation/main_route_delegate.dart';
import 'navigation/navigation_stack_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    NavigationStackManager.object.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Router(
        backButtonDispatcher: AppBackButtonDispatcher(NavigationStackManager.object),
        routerDelegate: MainRouterDelegate(stack: NavigationStackManager.object),
      ),
    );
  }
}
