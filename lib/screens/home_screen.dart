import 'package:flutter/material.dart';
import 'package:navigation2/navigation/models/route_state.dart';
import 'package:navigation2/navigator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const Text("home"),
            ElevatedButton(
                onPressed: () {
                  router.push(
                      path: AppRoutePaths.like,
                      state: const NavRouteState(data: "This is data "));
                },
                child: const Text("go to like"))
          ],
        ),
      ),
    );
  }
}
