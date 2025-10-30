import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1️⃣ Define a read-only provider
final appNameProvider = Provider<String>((ref) => "My Awesome App");

// void main() {
//   runApp(const ProviderScope(child: MyApp()));
// }

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appName = ref.watch(appNameProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(appName)),
        body: const Center(child: Text('Welcome!')),
      ),
    );
  }
}
