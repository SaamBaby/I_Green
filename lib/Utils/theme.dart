

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor:    Color(0xFF54E597),
    errorColor:      Color(0xFFff4c4c),
    textTheme: TextTheme(
      headline1: GoogleFonts.nunito(
        color: Colors.black,
        height: 1.1,
        fontSize: ScreenUtil().setSp(30),
        fontWeight: FontWeight.w900,
      ),
      headline2: GoogleFonts.nunito(
        fontSize: ScreenUtil().setSp(18),
        color: Colors.white,
        fontWeight: FontWeight.w900,
      ),
      headline5: GoogleFonts.nunito(
        color: Colors.black,
        fontSize: ScreenUtil().setSp(18),
        height: 1.1,
        fontWeight: FontWeight.w900,
      ),
      headline3:GoogleFonts.nunito(
        color: Colors.white,
        fontSize: ScreenUtil().setSp(40),
        fontWeight: FontWeight.w900,
      ),
      headline4: GoogleFonts.nunito(
        color: Color.fromRGBO(52, 43, 37, 1),
        fontSize: ScreenUtil().setSp(25),
        fontWeight: FontWeight.w900,
      ),

      bodyText1:GoogleFonts.varelaRound(
        fontSize: ScreenUtil().setSp(13),
        color: Colors.black.withOpacity(.5),
        height: 1.3,
        fontWeight: FontWeight.w700,
      ),
      bodyText2:GoogleFonts.varelaRound(
        fontSize: ScreenUtil().setSp(11),
        color: Colors.black,
        fontWeight: FontWeight.w900,
      ),

      subtitle1:GoogleFonts.varelaRound(
        fontSize: ScreenUtil().setSp(10),
        color: Colors.white,
        fontWeight: FontWeight.w700,
  ),
      subtitle2: GoogleFonts.varelaRound(
        fontSize: ScreenUtil().setSp(12),
        color: Colors.black26.withOpacity(.5),
        fontWeight: FontWeight.w800,
      ),

      button: GoogleFonts.varelaRound(
        fontSize: ScreenUtil().setSp(12),
        color: Colors.white,
        fontWeight: FontWeight.w900,
      ),
      caption: GoogleFonts.varelaRound(
        fontSize: ScreenUtil().setSp(11),
        color: Colors.grey,
        fontWeight: FontWeight.w600,
      ),


      // subtitle1: TextStyle(fontSize: 17),
      // subtitle2: TextStyle(fontSize: 15),
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
          TextStyle(color: Color(0xFF54E597), fontSize: 20.0, height: 0.8),
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



