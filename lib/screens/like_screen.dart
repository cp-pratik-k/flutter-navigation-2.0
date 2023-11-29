import 'package:flutter/material.dart';
import 'package:navigation2/navigator.dart';

class Like extends StatefulWidget {
  final String data;
  const Like({Key? key, required this.data}) : super(key: key);

  @override
  State<Like> createState() => _LikeState();
}

class _LikeState extends State<Like> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const Text("like"),
            Text(widget.data),
            ElevatedButton(
                onPressed: () {
                  router.push(path: AppRoutePaths.search);
                },
                child: const Text("go to search "))
          ],
        ),
      ),
    );
  }
}
