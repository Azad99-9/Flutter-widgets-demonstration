import 'package:first_project/views/demonstrate_tests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
//   testWidgets('Login works', (tester) async {
//   await tester.pumpWidget(MaterialApp(home: LoginScreen()));

//   await tester.enterText(find.byKey(ValueKey('email_field')), 'test@example.com');
//   await tester.enterText(find.byKey(ValueKey('password_field')), 'password123');

//   await tester.tap(find.byKey(ValueKey('login_button')));
//   await tester.pump();

//   expect(find.text('Welcome!'), findsOneWidget);
// });

    testWidgets('check if login screen works fine', (screen) async {
      await screen.pumpWidget(MaterialApp(home: LoginScreen()));

      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Login'), findsOneWidget);


      await screen.enterText(find.byKey(const ValueKey('email_field')), 'shaikazad2003@gmail.com');
      await screen.enterText(find.byKey(const ValueKey('password_field')), 'password');

      await screen.tap(find.byKey(ValueKey('login_button')));  
      await screen.pump();    

      expect(find.text('Welcome!'), findsOneWidget);
    });


  testWidgets('test the counter', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home:  HomeScreen(),
    ));

    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('increment_button')));
    await tester.pump();

    expect(find.text('1'), findsOneWidget);
  });

}