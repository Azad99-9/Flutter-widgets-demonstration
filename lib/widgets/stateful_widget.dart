import 'dart:async';

import 'package:flutter/material.dart';


// widget class
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

// state class
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int? _counter; // null
  List<int>? numbers; // null
  StreamController? _controller; // null
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _counter = 0;
    numbers = [1,2,3];

    _controller = StreamController();

  }
  
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    // _controller.dispose();
    super.dispose();

  }
}