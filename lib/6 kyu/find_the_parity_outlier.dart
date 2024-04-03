// You are given an array (which will have a length of at least 3, but could be very large) containing integers.
// The array is either entirely comprised of odd integers or entirely comprised of even integers except for a single
// integer N. Write a method that takes the array as an argument and returns this "outlier" N.

// Examples
// [2, 4, 0, 100, 4, 11, 2602, 36] -->  11 (the only odd number)

// [160, 3, 1719, 19, 11, 13, -21] --> 160 (the only even number)

// https://www.codewars.com/kata/5526fc09a1bbd946250002dc/train/dart

void main() {
  print(
      find3([2, 4, 0, 100, 4, 11, 2602, 36])); // -->  11 (the only odd number)
  print(
      find3([160, 3, 1719, 19, 11, 13, -21])); // --> 160 (the only even number)
}

int find(List<int> integers) {
  List<int> evenList = [];
  List<int> oddList = [];
  for (var integer in integers) {
    if (integer.isEven) {
      evenList.add(integer);
    } else {
      oddList.add(integer);
    }
  }
  return evenList.length == 1 ? evenList[0] : oddList[0];
}

int find2(List<int> integers) {
  List<int> evenList = [];
  List<int> oddList = [];
  for (var element in integers) {
    element.isEven ? evenList.add(element) : oddList.add(element);
  }
  return evenList.length == 1 ? evenList[0] : oddList[0];
}

int find3(List<int> integers) => integers.firstWhere(
    integers.getRange(0, 3).where((i) => i % 2 == 0).length > 1
        ? (i) => i % 2 == 1
        : (i) => i % 2 == 0);
