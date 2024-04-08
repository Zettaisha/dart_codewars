// Introduction
// The wave (known as the Mexican wave in the English-speaking world outside North America) is an example of metachronal rhythm achieved in a packed stadium when successive groups of spectators briefly stand, yell, and raise their arms. Immediately upon stretching to full height, the spectator returns to the usual seated position.

// The result is a wave of standing spectators that travels through the crowd, even though individual spectators never move away from their seats. In many large arenas the crowd is seated in a contiguous circuit all the way around the sport field, and so the wave is able to travel continuously around the arena; in discontiguous seating arrangements, the wave can instead reflect back and forth through the crowd. When the gap in seating is narrow, the wave can sometimes pass through it. Usually only one wave crest will be present at any given time in an arena, although simultaneous, counter-rotating waves have been produced. (Source Wikipedia)
// Task
// In this simple Kata your task is to create a function that turns a string into a Mexican Wave. You will be passed a string and you must return that string in an array where an uppercase letter is a person standing up.
// Rules
//  1.  The input string will always be lower case but maybe empty.

//  2.  If the character in the string is whitespace then pass over it as if it was an empty seat
// Example
// wave("hello") => {"Hello", "hEllo", "heLlo", "helLo", "hellO"}
// Good luck and enjoy!
// https://www.codewars.com/kata/58f5c63f1e26ecda7e000029/train/dart

void main(List<String> args) {
  print(wave('a       b    ')); // ["A       b    ", "a       B    "]
  print(wave(' gap ')); // [" Gap ", " gAp ", " gaP "]
  print(wave(
      'this is a few words')); // ["This is a few words", "tHis is a few words", "thIs is a few words", "thiS is a few words", "this Is a few words", "this iS a few words", "this is A few words", "this is a Few words", "this is a fEw words", "this is a feW words", "this is a few Words", "this is a few wOrds", "this is a few woRds", "this is a few worDs", "this is a few wordS"]
}

List<String> wave(String str) {
  List<String> result = [];
  for (var i = 0; i < str.length; i++) {
    if (RegExp(r'^[A-Za-z0-9_.]+$').hasMatch(str[i])) {
      result.add(str.replaceFirst(str[i], str[i].toUpperCase(), i));
    }
  }
  return result;
}

List<String> wave2(String str) {
  return RegExp(r'[a-z]')
      .allMatches(str)
      .map((match) => str.replaceFirst(
          str[match.start], str[match.start].toUpperCase(), match.start))
      .toList();
}
