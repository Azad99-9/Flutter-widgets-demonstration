// import 'package:flutter/material.dart';

// class CounterProvider extends InheritedWidget {
//   final int counter;

//   const CounterProvider({
//     required this.counter,
//     required super.child,
//   });



//   static CounterProvider of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<CounterProvider>()!;
//   }

//   @override
//   bool updateShouldNotify(CounterProvider oldWidget) {
//     return oldWidget.counter != counter;
//   }
// }

// class InheritedExample extends StatefulWidget {
//   @override
//   _InheritedExampleState createState() => _InheritedExampleState();
// }

// class _InheritedExampleState extends State<InheritedExample> {
//   int counter = 0;

//   void _increment() => setState(() => counter++);

//   @override
//   Widget build(BuildContext context) {
//     return  CounterProvider(
//         counter: counter, // 0 -> 1
//         child: Scaffold(
//         appBar: AppBar(title: Text('InheritedWidget Example')),
//         body: Center(child: CounterDisplay()),
//         floatingActionButton: FloatingActionButton(
//           onPressed: _increment,
//           child: Icon(Icons.add),
//         ),
      
//     ),);
//   }
// }

// class CounterDisplay extends StatefulWidget {
//   @override
//   State<CounterDisplay> createState() => _CounterDisplayState();
// }

// class _CounterDisplayState extends State<CounterDisplay> {
//   @override
//   void initState() {
//     print("I am initialised");
//     super.initState();
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     print('Dependencies changed – CounterProvider updated');
//   }

//   @override
//   Widget build(BuildContext context) {
//     final provider = CounterProvider.of(context);
//     return Text('Count: ${provider.counter}', style: TextStyle(fontSize: 24));
//   }
// }

