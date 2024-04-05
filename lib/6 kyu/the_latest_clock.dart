// Write a function which receives 4 digits and returns the latest time of day that can be built with those digits.

// The time should be in HH:MM format.

// Examples:

// digits: 1, 9, 8, 3 => result: "19:38"
// digits: 9, 1, 2, 5 => result: "21:59" (19:25 is also a valid time, but 21:59 is later)
// Notes
// Result should be a valid 24-hour time, between 00:00 and 23:59.
// Only inputs which have valid answers are tested.
// https://www.codewars.com/kata/58925dcb71f43f30cd00005f/train/dart

void main() {
  // print(latestClock(1, 9, 8, 3)); // 19:38
  // print(latestClock(9, 1, 2, 5)); // 21:59
  print(latestClock(1, 2, 8, 9)); // 19:28
}

String latestClock(int a, int b, int c, int d) {
  List<int> digits = [a, b, c, d].toList()..sort();
  List<int> result = [];

  // first digit of hours is max between 0 and 2
  for (var digit in digits.reversed) {
    if (digit == 2) {
      // Проверяем наличие еще двух подходящих цифр для оставшихся позиций
      bool hasHourDigits = digits.where((e) => e != digit).any((e) => e <= 3);
      bool hasMinuteDigits = digits.where((e) => e != digit).any((e) => e <= 5);
      if (hasHourDigits && hasMinuteDigits) {
        result.add(digit);
        digits.remove(digit);
        break;
      }
    } else if (digit < 2) {
      result.add(digit);
      digits.remove(digit);
      break;
    }
  }

  // second is max between 0 and 3 if first is 2, else max from 0-9 (because 20-23...)
  if (result[0] == 2) {
    int maxDigit = digits.reversed.firstWhere((digit) => digit <= 3);
    result.add(maxDigit);
    digits.remove(maxDigit);
  } else {
    int maxDigit = digits.reversed.first;
    result.add(maxDigit);
    digits.remove(maxDigit);
  }

  // first digit of minutes is max between 0 and 5
  int maxMinuteDigit = digits.reversed.firstWhere((digit) => digit <= 5);
  result.add(maxMinuteDigit);
  digits.remove(maxMinuteDigit);

  // last one is the last one ;D
  result.add(digits.first);

  return '${result[0]}${result[1]}:${result[2]}${result[3]}';
}
