import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'navigation/app_back_button_dispatcher.dart';
import 'navigation/main_route_delegate.dart';
import 'navigation/route_infomation_parser.dart';
import 'navigator.dart';

void main() {
  usePathUrlStrategy();
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
    stackManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: UrlHandlerInformationParser(stackManager),
      backButtonDispatcher: AppBackButtonDispatcher(stackManager),
      routerDelegate: MainRouterDelegate(stack: stackManager),
    );
  }
}
