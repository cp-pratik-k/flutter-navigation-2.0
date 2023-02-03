import 'package:flutter/material.dart';
import '../navigation/navigation_stack_item.dart';
import '../navigation/navigation_stack_manager.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const Text("settings"),
            ElevatedButton(onPressed: (){
              NavigationStackManager.object.clearAndPush(const NavStackItem(name: AppPage.home, path: AppRoutePaths.home));
            }, child: const Text("go to home") )
          ],
        ),
      ),
    );
  }
}