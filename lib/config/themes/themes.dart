import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  scaffoldBackgroundColor: const Color.fromRGBO(17, 21, 50, 1),
  primaryColor: Colors.red,
  backgroundColor: Colors.red,
  textTheme: TextTheme(
    bodySmall: TextStyle(
      fontSize: 12,
      color: const Color.fromRGBO(218, 218, 218, 1),
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: const Color.fromRGBO(230, 230, 230, 1),
    ),
  ),
);