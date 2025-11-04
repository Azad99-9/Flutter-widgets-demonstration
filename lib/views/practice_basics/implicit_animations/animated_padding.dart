import 'package:flutter/material.dart';

class AnimatedPaddingExample extends StatefulWidget {
  @override
  _AnimatedPaddingExampleState createState() => _AnimatedPaddingExampleState();
}

class _AnimatedPaddingExampleState extends State<AnimatedPaddingExample> {
  bool _padded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AnimatedPaddingExample Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.red,
              child: AnimatedPadding(
              duration: const Duration(seconds: 1),
              padding: EdgeInsets.all(_padded ? 50 : 10),
              child: const FlutterLogo(size: 80),
            ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _padded = !_padded;
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
