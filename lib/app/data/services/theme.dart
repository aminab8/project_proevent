import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


const Color bluishClr = Colors.deepPurple;
const Color yellowClr = Colors.yellow;
const Color pinkColor = Colors.pink;
const Color white = Colors.white;
const primaryClr = bluishClr;
const Color darkGreyClr = Colors.grey;
Color darkHeaderClr = Colors.black54;


class Themes {
  static final light = ThemeData(

      primaryColor: primaryClr,
      brightness: Brightness.light
  );


  static final dark = ThemeData(

      primaryColor: darkGreyClr,
      brightness: Brightness.dark
  );
}
TextStyle get subHeadingStyle{
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode?Colors.grey[400] : Colors.grey
    ),
  );
}
TextStyle get HeadingStyle{
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
        color: Get.isDarkMode?Colors.white : Colors.black
    ),
  );
}
TextStyle get titleStyle{
  return GoogleFonts.lato(
    textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Get.isDarkMode?Colors.white : Colors.black
    ),
  );
}
TextStyle get SubtitleStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Get.isDarkMode ? Colors.grey[100]:Colors.grey[600]
    ),
  );
}