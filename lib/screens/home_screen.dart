import 'package:flutter/material.dart';
import '../navigation/navigation_stack_item.dart';
import '../navigation/navigation_stack_manager.dart';

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
            ElevatedButton(onPressed: (){
              NavigationStackManager.object.push(const NavStackItem(name: AppPage.like, path: AppRoutePaths.like));
            }, child: const Text("go to like") )
          ],
        ),
      ),
    );
  }
}