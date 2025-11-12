import 'package:flutter_test/flutter_test.dart';

int add(int a, int b) => a + b;
int product(int a, int b) => a * b;


void main() {
  // test('adds two numbers', () {
  //   expect(add(2, 3), 5);
  // });

  test('testing add two numbers', () {
    expect(add(2, 3), 5);
    expect(add(2,2), 4);
  });

  test('testing multiply two numbers', () {
    expect(product(2, 3), 6);
  });
}
