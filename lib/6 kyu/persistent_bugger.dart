// Write a function, persistence, that takes in a positive parameter num and returns its multiplicative persistence,
//which is the number of times you must multiply the digits in num until you reach a single digit.

// For example (Input --> Output):

// 39 --> 3 (because 3*9 = 27, 2*7 = 14, 1*4 = 4 and 4 has only one digit, there are 3 multiplications)
// 999 --> 4 (because 9*9*9 = 729, 7*2*9 = 126, 1*2*6 = 12, and finally 1*2 = 2, there are 4 multiplications)
// 4 --> 0 (because 4 is already a one-digit number, there is no multiplication)

// link: https://www.codewars.com/kata/55bf01e5a717a0d57e0000ec

void main(List<String> args) {
  print(persistence(39)); // 3
  print(persistence(999)); // 4
  print(persistence(4)); // 0
}

int persistence(int number, [int steps = 0]) {
  if (number < 10) return steps;

  int nextNumber =
      number.toString().split('').map(int.parse).reduce((a, b) => a * b);

  return persistence(nextNumber, steps + 1);
}

// another guys simple solution:

int persistence2(int number) {
  int counter = 0;
  while (number.toString().length != 1) {
    number = number.toString().split('').fold(1, (a, b) => a *= int.parse(b));
    counter += 1;
  }
  return counter;
}
