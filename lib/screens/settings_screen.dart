import 'package:flutter/material.dart';
import 'package:navigation2/navigator.dart';

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
              stackManager.clearAndPush(AppRoutePaths.home);
            }, child: const Text("go to home") )
          ],
        ),
      ),
    );
  }
}