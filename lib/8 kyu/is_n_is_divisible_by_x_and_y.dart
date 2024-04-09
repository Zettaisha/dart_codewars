// Create a function that checks if a number n is divisible by two numbers x AND y. All inputs are positive, non-zero numbers.
// https://www.codewars.com/kata/5545f109004975ea66000086/train/dart

void main(List<String> args) {
  print(isDivisible(3, 1, 3)); //  true because   3 is divisible by 1 and 3
  print(isDivisible(12, 2, 6)); // true because  12 is divisible by 2 and 6
  print(isDivisible(100, 5, 3)); // false because 100 is not divisible by 3
}

bool isDivisible(int n, int x, int y) {
  return n % x == 0 && n % y == 0;
}
