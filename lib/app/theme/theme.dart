import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Theme_ {
  static const TextStyle ts1 = TextStyle(
      color: Color(0xFF0063DA), fontSize: 40, fontWeight: FontWeight.bold);

  static const aFontFamily = "Montserrat";

  //Colors
  static const MaterialColor aBlue = MaterialColor(
    _bluePrimaryValue,
    <int, Color>{
      50: Color(0xFFDBECFF),
      100: Color(0xFFA8D0FF),
      200: Color(0xFF75B4FF),
      300: Color(0xFF4298FF),
      400: Color(0xFF0F7CFF),
      500: Color(_bluePrimaryValue),
      600: Color(0xFF004CA8),
      700: Color(0xFF003575),
      800: Color(0xFF001E42),
      900: Color(0xFF000D1A),
    },
  );
  static final pageBg = Color(0xFFF8F8F8);
  static final darkBlue = Color(0xFF2C6EFF);
  static const greyEL = Color(0xFFC0C0C0);
  static const greyL = Color(0xFF979797);
  static const greyD = Color(0xFF828282);
  static const greyED = Color(0xFF494949);
  static const green = Color(0xFF50A948);
  static const int _bluePrimaryValue = 0xFF0063DA;
  static const red = Color(0xFFE84646);

  //Text Styles
  static const ts0r =
      TextStyle(fontSize: 50, fontFamily: aFontFamily, color: Colors.black);
  static final ts0rWhite = ts0r.copyWith(color: Colors.white);
  //font size 24
  static const ts1s = TextStyle(
      fontSize: 27,
      fontFamily: aFontFamily,
      color: Colors.black,
      fontWeight: FontWeight.w600);
  static final ts1sBlue = ts1s.copyWith(color: darkBlue);
  static final ts1rWhite =
      ts1.copyWith(color: Colors.white, fontWeight: FontWeight.normal);
  //20
  static const ts2r = TextStyle(
      fontSize: 24,
      fontFamily: aFontFamily,
      color: Colors.black,
      fontWeight: FontWeight.w500);
//18
  static const ts3r = TextStyle(
      fontSize: 21,
      fontFamily: aFontFamily,
      color: Colors.black,
      fontWeight: FontWeight.w500);
//18
  static final ts3b = ts3r.copyWith(fontWeight: FontWeight.w700);
  static final ts3bWhite =
      ts3r.copyWith(fontWeight: FontWeight.w700, color: Colors.white);
  static final ts3rWhite = ts3r.copyWith(color: Colors.white);
  static final ts3lWhite = ts3bWhite.copyWith(fontWeight: FontWeight.w300);
  static final ts3rDBlue = ts3r.copyWith(color: darkBlue);
  static final ts3rBlue = ts3r.copyWith(color: aBlue);
  static final ts3rGreyL = ts3r.copyWith(color: greyL);
  static final ts3rGreyD = ts3r.copyWith(color: greyD);

  static const ts4r = TextStyle(
      fontSize: 19,
      fontFamily: aFontFamily,
      color: Colors.black,
      fontWeight: FontWeight.w500);
  static final ts4s = ts4r.copyWith(fontWeight: FontWeight.w600);
  static final ts4l = ts4r.copyWith(fontWeight: FontWeight.w300);
  static final ts4rBlue = ts4r.copyWith(color: aBlue);
  static final ts4rWhite = ts4r.copyWith(color: Colors.white);
  static final ts4rGreyD = ts4r.copyWith(color: greyD);
  static final ts4rGreyL = ts4r.copyWith(color: greyL);

  static const ts5r = TextStyle(
      fontSize: 17,
      fontFamily: aFontFamily,
      color: Colors.black,
      fontWeight: FontWeight.w500);
  static final ts5rBlue = ts5r.copyWith(color: aBlue);
  static final ts5rGreyL = ts5r.copyWith(color: greyL);
  static final ts5rGreyD = ts5r.copyWith(color: greyD);
  static final ts5lGreyL = ts5rGreyL.copyWith(fontWeight: FontWeight.w300);
  static final ts5s = ts5r.copyWith(fontWeight: FontWeight.w600);
  static final ts5sBlue = ts5s.copyWith(color: aBlue);
  static final ts5sGreyD = ts5s.copyWith(color: greyD);
  static final ts5lGreyD = ts5sGreyD.copyWith(fontWeight: FontWeight.w300);

  static const ts6r = TextStyle(
      fontSize: 15,
      fontFamily: aFontFamily,
      color: Colors.black,
      fontWeight: FontWeight.w500);
  static final ts6l = ts6r.copyWith(fontWeight: FontWeight.w300);
  static final ts6s = ts6r.copyWith(fontWeight: FontWeight.w600);
  static final ts6sGreyL = ts6s.copyWith(color: greyL);
  static final ts6sBlue = ts6s.copyWith(color: darkBlue);
  static final ts6sRed = ts6s.copyWith(color: red);
  static final ts6sGreen = ts6s.copyWith(color: green);

  static const ts7r = TextStyle(
      fontSize: 13,
      fontFamily: aFontFamily,
      color: Colors.black,
      fontWeight: FontWeight.w500);
  static final ts7l = ts7r.copyWith(fontWeight: FontWeight.w300);

  static const tS15white = TextStyle(fontSize: 15, color: Colors.white);
  static const tS20white = TextStyle(fontSize: 20, color: Colors.white);
  static const tS25white = TextStyle(fontSize: 30, color: Colors.white);
}
