// Check to see if a string has the same amount of 'x's and 'o's. The method must return a boolean and be case insensitive. The string can contain any char.

// Examples input/output:

// XO("ooxx") => true
// XO("xooxx") => false
// XO("ooxXm") => true
// XO("zpzpzpp") => true // when no 'x' and 'o' is present should return true
// XO("zzoo") => false

void main() {
  print(XO("ooxx")); // true
  print(XO("xooxx")); // false
  print(XO2("zpzpzpp")); // when no 'x' and 'o' is present should return true
}

bool XO(String str) {
  int xs = 'x'.allMatches(str.toLowerCase()).length;
  int os = 'o'.allMatches(str.toLowerCase()).length;
  return xs == os;
}

bool XO2(String str) {
  return 'x'.allMatches(str.toLowerCase()).length ==
      'o'.allMatches(str.toLowerCase()).length;
}
