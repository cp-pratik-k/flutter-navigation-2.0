import 'package:flutter/material.dart';
import 'package:navigation2/navigator.dart';

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
            ElevatedButton(
                onPressed: () {
                  stackManager.push(AppRoutePaths.settings);
                },
                child: const Text("Go to Setting"))
          ],
        ),
      ),
    );
  }
}
