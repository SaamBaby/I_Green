import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor:    Color(0xFF54E597),
    textTheme: TextTheme(
      headline1: GoogleFonts.montserrat(
        color: Color.fromRGBO(52, 43, 37, 1),
        fontSize: ScreenUtil().setSp(25),
        fontWeight: FontWeight.w900,
      ),
      headline2: GoogleFonts.montserrat(
        fontSize: ScreenUtil().setSp(40),
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      headline3: GoogleFonts.montserrat(
        color: Colors.white,
        fontSize: ScreenUtil().setSp(14),
        fontWeight: FontWeight.w900,
      ),
      headline4: GoogleFonts.montserrat(
        color: Color.fromRGBO(52, 43, 37, 1),
        fontSize: ScreenUtil().setSp(14),
        fontWeight: FontWeight.w900,
      ),
      bodyText2:GoogleFonts.varelaRound(
        fontSize: ScreenUtil().setSp(12),
        color: Color.fromRGBO(52, 43, 37, 1),
        fontWeight: FontWeight.w600,
      ),
      bodyText1:GoogleFonts.varelaRound(
        fontSize: ScreenUtil().setSp(14),
        color: Color.fromRGBO(52, 43, 37, 1),
        fontWeight: FontWeight.w700,
      ),
      subtitle1: GoogleFonts.varelaRound(
        fontSize: ScreenUtil().setSp(11),
        color: Colors.white,
        fontWeight: FontWeight.w700,
  ),
      subtitle2: GoogleFonts.varelaRound(
        fontSize: ScreenUtil().setSp(11),
        color: Colors.grey,
        fontWeight: FontWeight.w700,
      ),
      button: GoogleFonts.varelaRound(
        fontSize: ScreenUtil().setSp(14),
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      caption: GoogleFonts.varelaRound(
        fontSize: ScreenUtil().setSp(11),
        color: Colors.grey,
        fontWeight: FontWeight.w600,
      ),
      // headline5: TextStyle(fontSize: 34, color: Colors.black),
      // headline4: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
      // headline3: TextStyle(fontSize: 28, color: Colors.black),
      // headline2: TextStyle(fontSize: 22, color: Colors.black),
      // headline1: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.black),

      // subtitle1: TextStyle(fontSize: 17),
      // subtitle2: TextStyle(fontSize: 15),
      // caption: TextStyle(fontSize: 12),
    ),
    appBarTheme: appBarTheme(),
    visualDensity: VisualDensity.comfortable,
    inputDecorationTheme: inputDecorationTheme(),
  );
}




InputDecorationTheme inputDecorationTheme() {
  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Colors.grey),
    gapPadding: 12,
  );

  return InputDecorationTheme(
      labelStyle:
          TextStyle(color: Color(0xFFa6e76c), fontSize: 20.0, height: 0.8),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      border: outlineInputBorder);
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    centerTitle: true,
    brightness: Brightness.light,
    textTheme: TextTheme(
      headline: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
    ),
  );
}



