// This time no story, no theory. The examples below show you how to write function accum:

// Examples:
// accum("abcd") -> "A-Bb-Ccc-Dddd"
// accum("RqaEzty") -> "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
// accum("cwAt") -> "C-Ww-Aaa-Tttt"
// The parameter of accum is a string which includes only letters from a..z and A..Z.

void main() {
  print(accum("abcd")); // -> "A-Bb-Ccc-Dddd"
  print(simpleAccum("RqaEzty")); // -> "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
  print(accum("cwAt")); // -> "C-Ww-Aaa-Tttt"
}

String accum(String str) {
  return str
      .split('') // split str on a single letters
      .asMap() // cast to Map (0: a, 1: b, 2: c, ...)
      .map((i, s) => MapEntry(i,
          '${s.toUpperCase()}${s.toLowerCase() * i}')) // i = int 0-n, s = letter a-z; for each pair => S + s*i etc. i starts with 0
      .values // return values - our new modified strings
      .join('-'); // join Iterable values into one string with '-' separator
}

// first and much easier solution
String simpleAccum(String str) {
  List<String> r = [];

  for (int i = 0; i < str.length; i++) {
    var c = str[i];
    r.add(c.toUpperCase() + c.toLowerCase() * i);
  }

  return r.join("-");
}
