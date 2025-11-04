import 'package:flutter/material.dart';

class AnimatedCrossfadeExample extends StatefulWidget {
  @override
  _AnimatedCrossfadeExampleState createState() => _AnimatedCrossfadeExampleState();
}

class _AnimatedCrossfadeExampleState extends State<AnimatedCrossfadeExample> {
  bool _liked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AnimatedCrossfadeExample Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedCrossFade(
  duration: const Duration(seconds: 1),
  firstChild: const Icon(Icons.favorite, color: Colors.red, size: 100),
  secondChild: const Icon(Icons.favorite_border, size: 100),
  crossFadeState: _liked
      ? CrossFadeState.showFirst
      : CrossFadeState.showSecond,
)
,
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _liked = !_liked;
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
