// Your task in order to complete this Kata is to write a function which formats a duration, given as a number of seconds, in a human-friendly way.

// The function must accept a non-negative integer. If it is zero, it just returns "now". Otherwise, the duration is expressed as a combination of years, days, hours, minutes and seconds.

// It is much easier to understand with an example:

// * For seconds = 62, your function should return
//     "1 minute and 2 seconds"
// * For seconds = 3662, your function should return
//     "1 hour, 1 minute and 2 seconds"
// For the purpose of this Kata, a year is 365 days and a day is 24 hours.

// Note that spaces are important.

// Detailed rules
// The resulting expression is made of components like 4 seconds, 1 year, etc. In general, a positive integer and one of the valid units of time, separated by a space. The unit of time is used in plural if the integer is greater than 1.

// The components are separated by a comma and a space (", "). Except the last component, which is separated by " and ", just like it would be written in English.

// A more significant units of time will occur before than a least significant one. Therefore, 1 second and 1 year is not correct, but 1 year and 1 second is.

// Different components have different unit of times. So there is not repeated units like in 5 seconds and 1 second.

// A component will not appear at all if its value happens to be zero. Hence, 1 minute and 0 seconds is not valid, but it should be just 1 minute.

// A unit of time must be used "as much as possible". It means that the function should not return 61 seconds, but 1 minute and 1 second instead. Formally, the duration specified by of a component must not be greater than any valid more significant unit of time.

// link: https://www.codewars.com/kata/52742f58faf5485cae000b9a/train/dart
void main(List<String> args) {
  print(formatDuration(0));
  print(formatDuration(132030240));
}

String formatDuration(int totalSeconds) {
  if (totalSeconds > 0) {
    int years = totalSeconds ~/ 31536000;
    int days = (totalSeconds % 31536000) ~/ 86400;
    int hours = (totalSeconds % 86400) ~/ 3600;
    int minutes = (totalSeconds % 3600) ~/ 60;
    int seconds = totalSeconds % 60;

    List<String> parts = [];

    if (years > 0) parts.add('$years year${addPlural(years)}');
    if (days > 0) parts.add('$days day${addPlural(days)}');
    if (hours > 0) parts.add('$hours hour${addPlural(hours)}');
    if (minutes > 0) parts.add('$minutes minute${addPlural(minutes)}');
    if (seconds > 0) parts.add('$seconds second${addPlural(seconds)}');

    return parts.length > 1
        ? '${parts.sublist(0, parts.length - 1).join(', ')} and ${parts.last}'
        : parts.first;
  }
  return 'now';
}

String addPlural(int value) {
  return value > 1 ? 's' : '';
}

// another dude's BEST solution by monadius

const intervals = [
  (3600 * 24 * 365, "year"),
  (3600 * 24, "day"),
  (3600, "hour"),
  (60, "minute"),
  (1, "second")
];

String formatDuration2(int totalSeconds) {
  final res = <String>[];
  for (var (t, name) in intervals) {
    int x = totalSeconds ~/ t;
    if (x > 0) {
      res.add('$x $name${x > 1 ? 's' : ''}');
    }
    totalSeconds %= t;
  }
  return switch (res) {
    [] => 'now',
    [var x] => x,
    [...var xs, var x] => '${xs.join(', ')} and $x',
  };
}






















// test(' 0 seconds', () {
//       expect(formatDuration(0), "now");
//     });
//     test(' 1 second', () {
//       expect(formatDuration(1), "1 second");
//     });
//     test(' 62 seconds', () {
//       expect(formatDuration(62), "1 minute and 2 seconds");
//     });
//     test(' 120 seconds', () {
//       expect(formatDuration(120), "2 minutes");
//     });
//     test(' 3600 seconds', () {
//       expect(formatDuration(3600), "1 hour");
//     });
// Можете сравнить с оригиналом, тут я заметил опечатку в названии теста, из-за которой я опешил в моменте ;D
//     test(' 3662 seconds', () {
//       expect(formatDuration(3662), "1 hour, 1 minute and 2 seconds");
//     });
//     test(' 132030240 seconds', () {
//       expect(formatDuration(132030240), "4 years, 68 days, 3 hours and 4 minutes");
//     });       
