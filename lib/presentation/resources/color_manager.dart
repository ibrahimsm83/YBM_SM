import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = const Color(0xff009FE3);
  static Color secondary = const Color(0xff5669FF);
  static Color whiteColor = Colors.white;
  static Color blackColor = Colors.black;
  static Color hintTextColor = const Color(0xff8F9098);
  static Color textInputColor = const Color(0xff1F2024);
  static Color headingColor = const Color(0xff666666);
  static Color subheadingColor = const Color(0xff71727A);
  static Color borderColor = const Color(0xffC5C6CC);
  static Color redColor = const Color(0xffED3241);
  static Color appleColor = const Color(0xff1F2024);
  static Color selectedColor = const Color(0xffE5F9F9);
  static Color unselectedIconColor = const Color(0xffD4D6DD);
  static Color unselectedSizeColor = const Color(0xffEAF2FF);


  static Color seacrhFilledColor = const Color(0xffF8F9FE);
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
