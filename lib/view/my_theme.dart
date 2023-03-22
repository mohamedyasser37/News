
import 'package:flutter/material.dart';

class MyThemeData {

  static const Color bg = Color.fromRGBO(0, 0, 0, 1.0);
  static const Color darkprimary = Color.fromRGBO(6, 14, 30, 1.0);
  static const Color primary = Color.fromRGBO(223, 236, 219, 1.0); //141A2E
  static const Color bluePrimary = Color.fromRGBO(93, 156, 236, 1.0); //FACC1D
  static const Color yellowColor = Color.fromRGBO(250, 204, 29, 1.0);
  static ThemeData lightTheme = ThemeData(
      primaryColor: primary,
      scaffoldBackgroundColor:primary,
      colorScheme: ColorScheme(
        primary: bluePrimary,
        onPrimary: darkprimary,
        secondary: bluePrimary,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        surface: Colors.grey.shade300,
        onSurface: darkprimary,
        background: bluePrimary,
        onBackground: Colors.white,
        brightness: Brightness.light,
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: bluePrimary,


          elevation: 0.0,
          iconTheme: IconThemeData(color: darkprimary)),
      textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 30, color: darkprimary, fontWeight: FontWeight.bold),
          headline2: TextStyle(
            fontSize: 10,
          ),
          subtitle1: TextStyle(fontSize: 25, color: bluePrimary)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: bluePrimary,
          unselectedItemColor:  Colors.grey));
  static ThemeData darkTheme = ThemeData(
      primaryColor: bluePrimary,
      scaffoldBackgroundColor: bg,
      colorScheme: ColorScheme(
        primary: bluePrimary,
        onPrimary:Colors.white,
        secondary: Colors.white,
        onSecondary: darkprimary,
        error: Colors.red,
        onError: Colors.white,
        surface: Colors.grey.shade300,
        onSurface: darkprimary,
        background:bluePrimary,
        onBackground: Colors.white,
        brightness: Brightness.dark,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor:bluePrimary,
        elevation: 0.0,
        iconTheme: IconThemeData(color: bluePrimary)),
    textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
        subtitle1: TextStyle(fontSize: 25, color: bluePrimary)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: darkprimary,
        selectedItemColor: bluePrimary,

        unselectedItemColor: Colors.white),
  );
}
