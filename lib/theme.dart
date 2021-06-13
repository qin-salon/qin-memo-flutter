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
    dividerColor: const Color(0xFFEAEBEC),
    textTheme: textTheme.copyWith(
      headline5: textTheme.headline5
          ?.copyWith(fontSize: 22, fontWeight: FontWeight.bold),
      subtitle1: textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold),
      subtitle2: textTheme.subtitle2?.copyWith(
          color: const Color(0xFF9CA3AF),
          fontSize: 14,
          fontWeight: FontWeight.bold),
      bodyText1: textTheme.bodyText1?.copyWith(fontSize: 16),
      caption: textTheme.caption?.copyWith(color: const Color(0xFF9CA3AF)),
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
      headline5: textTheme.headline5
          ?.copyWith(fontSize: 22, fontWeight: FontWeight.bold),
      subtitle1: textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold),
      subtitle2: textTheme.subtitle2?.copyWith(
          color: const Color(0xFF9CA3AF),
          fontSize: 14,
          fontWeight: FontWeight.bold),
      bodyText1: textTheme.bodyText1?.copyWith(fontSize: 16),
      caption: textTheme.caption?.copyWith(color: const Color(0xFF9CA3AF)),
    ),
    backgroundColor: const Color(0xFF3F3F46),
    cardColor: const Color(0xFF3F3F46),
    disabledColor: const Color(0xFFC2C6D2),
    dialogBackgroundColor: const Color(0xFF27272A),
    dividerColor: const Color(0xFF27272A),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF27272A),
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
    scaffoldBackgroundColor: const Color(0xFF27272A),
  );
}
