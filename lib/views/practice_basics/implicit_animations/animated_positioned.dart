import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AnimatedPositionedExample extends StatefulWidget {
  @override
  _AnimatedPositionedExampleState createState() => _AnimatedPositionedExampleState();
}

class _AnimatedPositionedExampleState extends State<AnimatedPositionedExample> {
  bool _moved = true;

  @override
  Widget build(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');
    print(usersRef);
    return StreamBuilder(
      stream: usersRef.snapshots(),
      builder: (builder, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
        ));
        if (snapshot.hasData) {
          print(snapshot.data!.docs[0].data());
        }
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
              child: Text("${snapshot.data!.docs.length}"),
            )
          ],
        ),
      ),
    );
    });
  }
}
