import 'package:flutter/material.dart';

class HexColor extends Color {
  HexColor(String hexColor) : super(getColorFromHex(hexColor));

  static int getColorFromHex(String hexColor) {
    var color = hexColor.toUpperCase().replaceAll('#', '');
    if (color.length == 6) {
      color = 'FF$color';
    }
    return int.parse(color, radix: 16);
  }
}

class HexMaterialColor extends MaterialColor {
  HexMaterialColor(String hexColor)
      : super(HexColor.getColorFromHex(hexColor), {
          50: const Color(0xFFECF7F8),
          100: const Color(0xFFD0EBEC),
          200: const Color(0xFFB1DDE0),
          300: const Color(0xFF91CFD4),
          400: const Color(0xFF7AC5CA),
          500: const Color(0xFF62BBC1),
          600: const Color(0xFF5AB5BB),
          700: const Color(0xFF50ACB3),
          800: const Color(0xFF46A4AB),
          900: const Color(0xFF34969E),
        });
}
