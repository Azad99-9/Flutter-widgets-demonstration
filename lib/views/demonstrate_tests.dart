import 'package:flutter/material.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Testing Demo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$counter', style: const TextStyle(fontSize: 40)),
            const SizedBox(height: 20),
            ElevatedButton(
              key: const ValueKey('go_to_login'), // testable navigation key
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              },
              child: const Text("Go to Login Screen"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const ValueKey('increment_button'), // testable button key
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool loggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Screen")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: loggedIn
            ? const Center(
                child: Text(
                  "Welcome!",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              )
            : Column(
                children: [
                  TextField(
                    key: const ValueKey('email_field'),
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    key: const ValueKey('password_field'),
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: "Password",
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    key: const ValueKey('login_button'),
                    onPressed: () {
                      setState(() {
                        loggedIn = true;
                      });
                    },
                    child: const Text("Login"),
                  )
                ],
              ),
      ),
    );
  }
}


