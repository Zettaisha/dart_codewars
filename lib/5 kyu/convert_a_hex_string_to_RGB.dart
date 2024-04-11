// When working with color values it can sometimes be useful to extract the individual red, green, and blue (RGB) component values for a color. Implement a function that meets these requirements:

// Accepts a case-insensitive hexadecimal color string as its parameter (ex. "#FF9933" or "#ff9933")
// Returns a Map<String, int> with the structure {r: 255, g: 153, b: 51} where r, g, and b range from 0 through 255
// Note: your implementation does not need to support the shorthand form of hexadecimal notation (ie "#FFF")

// Example
// "#FF9933" --> {r: 255, g: 153, b: 51}
// https://www.codewars.com/kata/5282b48bb70058e4c4000fa7/train/dart

void main(List<String> args) {
  print(hexToRGB("#FF9933")); // { "r": 255, "g": 153, "b": 51 }
  print(hexToRGB("#FA13F3")); // { "r": 250, "g": 19, "b": 243 }
  print(hexToRGB("#84002C")); // { "r": 132, "g": 0, "b": 44 }
}

// to convert HEX -> RGB we just need to split HEX on 3 hexademical parts (FF, 99, 33) and convert each one to decimal
// FF = 255, because FF = (15 × 16^1) + (15 × 16^0) = 240 + 15 = 255

Map<String, int> hexToRGB(String hex) {
  Map<String, int> result = {'r': 0, 'g': 0, 'b': 0};
  hex = hex.replaceAll('#', '')..toLowerCase();
  for (var key in result.keys) {
    result.update(key, (value) {
      switch (key) {
        case 'r':
          return int.tryParse(hex.substring(0, 2), radix: 16) ?? 0;
        case 'g':
          return int.tryParse(hex.substring(2, 4), radix: 16) ?? 0;
        case 'b':
          return int.tryParse(hex.substring(4, 6), radix: 16) ?? 0;
        default:
          return 0;
      }
    });
  }
  return result;
}

Map<String, int> hexToRGB2(String hex) => {
      'r': int.parse(hex.substring(1, 3), radix: 16),
      'g': int.parse(hex.substring(3, 5), radix: 16),
      'b': int.parse(hex.substring(5, 7), radix: 16)
    };
