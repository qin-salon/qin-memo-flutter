import 'package:flutter/material.dart';

extension CustomColorScheme on ColorScheme {
  Color get searchBackgroudColor => brightness == Brightness.light
      ? const Color(0xFFF3F4F6)
      : const Color(0xFF374151);
}
