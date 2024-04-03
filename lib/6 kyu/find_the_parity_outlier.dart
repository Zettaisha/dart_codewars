// You are given an array (which will have a length of at least 3, but could be very large) containing integers.
// The array is either entirely comprised of odd integers or entirely comprised of even integers except for a single
// integer N. Write a method that takes the array as an argument and returns this "outlier" N.

// Examples
// [2, 4, 0, 100, 4, 11, 2602, 36] -->  11 (the only odd number)

// [160, 3, 1719, 19, 11, 13, -21] --> 160 (the only even number)

// https://www.codewars.com/kata/5526fc09a1bbd946250002dc/train/dart

void main() {
  print(find([2, 4, 0, 100, 4, 11, 2602, 36])); // -->  11 (the only odd number)
  print(
      find([160, 3, 1719, 19, 11, 13, -21])); // --> 160 (the only even number)
}

int find(List<int> integers) {
  List<int> evenList = [];
  List<int> oddList = [];
  for (var integer in integers) {
    if (integer % 2 == 0) {
      evenList.add(integer);
    } else {
      oddList.add(integer);
    }
  }
  return evenList.length == 1
      ? integers[integers.indexOf(evenList[0])]
      : integers[integers.indexOf(oddList[0])];
}
