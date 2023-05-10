import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex("#DA3679");
  static Color darkGrey = HexColor.fromHex("#525252");
  static Color grey = HexColor.fromHex("#3D3D3D");
  static Color lightGrey = HexColor.fromHex("#f0f0f0");
  static Color primaryOpacity70 = HexColor.fromHex("#B36F59F9");
  static Color bgColor = HexColor.fromHex("E8E7F0");

  // new colors
  static Color darkPrimary = HexColor.fromHex("#483AA5");
  static Color grey1 = HexColor.fromHex("#707070");
  static Color grey2 = HexColor.fromHex("#797979");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color black = HexColor.fromHex("#000000");
  static Color linkText = HexColor.fromHex("#00A3FE");
  static Color error = HexColor.fromHex("#e61f34"); // red color
  static Color success = HexColor.fromHex("#009E60"); // green color
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
