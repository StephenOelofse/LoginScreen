import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.purple,
      primaryColor: Color.fromARGB(255, 189, 169, 192),
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Montserrat',
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 50),
        headline2: TextStyle(fontSize: 40),
        headline6: TextStyle(fontSize: 30.0),
        bodyText2: TextStyle(fontSize: 14.0),
      ),
    );
  }

  // static ThemeData get darkTheme {
  //   return ThemeData(
  //       primaryColor: Colors.grey[400],
  //       scaffoldBackgroundColor: Colors.black,
  //       fontFamily: 'Montserrat',
  //       textTheme: ThemeData.dark().textTheme,
  //       buttonTheme: ButtonThemeData(
  //         shape:
  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
  //         buttonColor: Colors.black87,
  //       ));
  // }
}
