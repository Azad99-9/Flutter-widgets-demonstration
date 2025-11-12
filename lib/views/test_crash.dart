import 'package:flutter/material.dart';

class TestCrash extends StatelessWidget {
  const TestCrash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ElevatedButton(
  onPressed: () {
    throw Exception("Test Crash!");
  },
  child: Text("Test Crash"),
)
,),
    );
  }
}