import 'package:flutter/material.dart';
import '../navigation/navigation_stack_item.dart';
import '../navigation/navigation_stack_manager.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const Text("search"),
            ElevatedButton(onPressed: (){
              NavigationStackManager.object.push(const NavStackItem(name: AppPage.settings, path: AppRoutePaths.settings));
            }, child: const Text("Go to Setting") )
          ],
        ),
      ),
    );
  }
}