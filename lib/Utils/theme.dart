import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(bodyText2: TextStyle(
        fontFamily: 'Futura Book',
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.w700)),
    fontFamily: "Futura Book",
    appBarTheme: appBarTheme(),
    visualDensity: VisualDensity.comfortable,
    inputDecorationTheme: inputDecorationTheme(),
  );
}

InputDecorationTheme inputDecorationTheme() {
  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
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

InputDecorationTheme otpInputDecorationTheme() {

}

