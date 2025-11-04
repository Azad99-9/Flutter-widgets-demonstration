import 'package:flutter/material.dart';

class AnimatedAlignExample extends StatefulWidget {
  @override
  _AnimatedAlignExampleState createState() => _AnimatedAlignExampleState();
}

class _AnimatedAlignExampleState extends State<AnimatedAlignExample> {
  bool _isLeft = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AnimatedAlign Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedAlign(
              alignment: _isLeft ? Alignment.centerLeft : Alignment.centerRight,
              duration: const Duration(seconds: 1),
              curve: Curves.bounceInOut,
              child: const FlutterLogo(size: 60),
            )
,
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isLeft = !_isLeft;
                });
              },
              child: const Text("Toggle Visibility"),
            )
          ],
        ),
      ),
    );
  }
}
