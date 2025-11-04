import 'package:flutter/material.dart';

class AnimatedPositionedExample extends StatefulWidget {
  @override
  _AnimatedPositionedExampleState createState() => _AnimatedPositionedExampleState();
}

class _AnimatedPositionedExampleState extends State<AnimatedPositionedExample> {
  bool _moved = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AnimatedPositionedExample Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.red,
              width: 500,
              height: 500,
              child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(seconds: 1),
                  left: _moved ? 200 : 20,
                  top: _moved ? 300 : 50,
                  child: const FlutterLogo(size: 80),
                ),
              ],
            )
            ,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _moved = !_moved;
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
