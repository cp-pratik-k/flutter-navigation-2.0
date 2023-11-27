import 'package:flutter/material.dart';
import 'package:navigation2/navigator.dart';

class Like extends StatefulWidget {
  const Like({Key? key}) : super(key: key);

  @override
  State<Like> createState() => _LikeState();
}

class _LikeState extends State<Like> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const Text("like"),
            ElevatedButton(onPressed: (){
              stackManager.push(AppRoutePaths.search);
            }, child: const Text("go to search ") )
          ],
        ),
      ),
    );
  }
}