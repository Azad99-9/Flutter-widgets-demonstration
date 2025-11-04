import 'package:flutter/material.dart';

class TweenExample extends StatefulWidget {
  @override
  _TweenExampleState createState() => _TweenExampleState();
}

class _TweenExampleState extends State<TweenExample> {
  bool _expanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TweenExample Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: _expanded ? 200 : 100),
              duration: const Duration(seconds: 1),
              builder: (context, value, child) {
                return Container(
                  width: value,
                  height: value,
                  color: Colors.purple,
                );
              },
            )
            ,
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
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
