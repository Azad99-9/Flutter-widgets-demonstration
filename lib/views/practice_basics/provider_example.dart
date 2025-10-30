// counter_provider.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PackagedCounterProvider extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners(); // tells listeners to rebuild
  }
}


// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => PackagedCounterProvider(),
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Provider Counter')),
//         body: const CounterScreenProviderExample(),
//       ),
//     );
//   }
// }

class CounterScreenProviderExample extends StatelessWidget {
  const CounterScreenProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PackagedCounterProvider>();

    int count = provider.count;
    var increment = provider.increment;
   
    return Scaffold(
          body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Count: ${count}', style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: increment,
            child: const Text('Increment'),
          ),
        ],
      ),
    ),
        );
  }
}
