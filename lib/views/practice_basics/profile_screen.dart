import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile'),),
      body: Center(child: TextButton(onPressed: () {
        final String returnName = 'Mary Jane';
        // context.pop(context, returnName);

      }, child: Text("click me to go back, Hi $name"))),
    );
  }
}