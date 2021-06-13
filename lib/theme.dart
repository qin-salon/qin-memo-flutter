import 'package:flutter/material.dart';

const _primaryColor = Color(0xFF3B82F6);

ThemeData buildLightTheme() {
  final TextTheme textTheme = Typography.material2018().black;

  return ThemeData.from(
    colorScheme: const ColorScheme.light(
      primary: _primaryColor,
      secondary: Color(0xFFFB923C),
    ),
  ).copyWith(
    backgroundColor: const Color(0xFFF3F4F6),
    cardColor: const Color(0xFFF3F4F6),
    disabledColor: const Color(0xFFC2C6D2),
    dialogBackgroundColor: Colors.white,
    textTheme: textTheme.copyWith(
      subtitle1: textTheme.subtitle1?.copyWith(
          color: const Color(0xFF9CA3AF),
          fontSize: 14,
          fontWeight: FontWeight.bold),
      subtitle2: textTheme.subtitle2
          ?.copyWith(color: const Color(0xFF9CA3AF), fontSize: 12),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      textTheme: textTheme.copyWith(
        headline6: textTheme.headline6!.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
  );
}

ThemeData buildDarkTheme() {
  final TextTheme textTheme = Typography.material2018().white;

  return ThemeData.from(
    colorScheme: const ColorScheme.dark(
      primary: _primaryColor,
      secondary: Color(0xFFFB923C),
    ),
  ).copyWith(
    textTheme: textTheme.copyWith(
      subtitle1: textTheme.subtitle1?.copyWith(
          color: const Color(0xFF9CA3AF),
          fontSize: 14,
          fontWeight: FontWeight.bold),
      subtitle2: textTheme.subtitle2
          ?.copyWith(color: const Color(0xFF9CA3AF), fontSize: 12),
    ),
    backgroundColor: const Color(0xFF374151),
    cardColor: const Color(0xFF374151),
    disabledColor: const Color(0xFFC2C6D2),
    dialogBackgroundColor: const Color(0xFF1F2937),
    appBarTheme: AppBarTheme(
      elevation: 0,
      // iconTheme: const IconThemeData(color: Colors.white),
      textTheme: textTheme.copyWith(
        headline6: textTheme.headline6!.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
    // scaffoldBackgroundColor: Colors.orange,
  );
}
