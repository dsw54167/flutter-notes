import 'dart:ui';

class MyColors {

  static final black = HexColor('#0E0E0E');
  static final white = HexColor('#FFFFFF');
  static final purple = HexColor('#471AA0');
  static final pink = HexColor('#9747FF');
  static final anotherPink = HexColor('#BB84E8');
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
