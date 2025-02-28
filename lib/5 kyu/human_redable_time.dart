// Human Readable Time
// Write a function, which takes a non-negative integer (seconds) as input and returns the time in a human-readable format (HH:MM:SS)

// HH = hours, padded to 2 digits, range: 00 - 99
// MM = minutes, padded to 2 digits, range: 00 - 59
// SS = seconds, padded to 2 digits, range: 00 - 59
// The maximum time never exceeds 359999 (99:59:59)

// You can find some examples in the test fixtures.

void main(List<String> args) {
  print(humanReadable(0));
  print(humanReadable(5));
  print(humanReadable(60));
  print(humanReadable(86399));
  print(humanReadable(359999));
}

String humanReadable(int totalSeconds) {
  int hours = totalSeconds / 60 ~/ 60;
  int minutes = totalSeconds % 3600 ~/ 60;
  int seconds = totalSeconds % 60;

  return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
}
