// Create a function that takes an integer as an argument and returns "Even" for even numbers or "Odd" for odd numbers.
// https://www.codewars.com/kata/53da3dbb4a5168369a0000fe/train/dart

void main() {
  print(evenOrOdd(15)); // odd
  print(evenOrOdd2(4)); // even
  print(evenOrOdd3(0)); // odd
}

String evenOrOdd(int number) {
  return number.isEven ? 'Even' : 'Odd';
}

String evenOrOdd2(int number) {
  return ['Even', 'Odd'][number % 2];
}

String evenOrOdd3(int number) => number.isEven ? 'Even' : 'Odd';
