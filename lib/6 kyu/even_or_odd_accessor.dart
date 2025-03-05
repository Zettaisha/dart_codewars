// Create a function or callable object that takes an integer as an argument and returns "Even" for even numbers or "Odd"
//for odd numbers. The function should also return "Even" or "Odd" when accessing a value at an integer index.

// For example:

// evenOrOdd(2); //'Even'
// evenOrOdd[2]; //'Even'
// evenOrOdd(7); //'Odd'
// evenOrOdd[7]; //'Odd'

// link: https://www.codewars.com/kata/6656a4687f3e4eb5fb520817/dart

void main(List<String> args) {
  print(evenOrOdd(1));
  print(evenOrOdd(3));
  print(evenOrOdd(4));
  print(evenOrOdd[22]);
  print(evenOrOdd[77]);
}

class EvenOrOdd {
  String call(int number) => number.isEven ? 'Even' : 'Odd';

  String operator [](int number) => call(number);
}

final evenOrOdd = EvenOrOdd();
