import 'package:flutter/material.dart';

extension CustomColorScheme on ColorScheme {
  Color get searchBackgroudColor => brightness == Brightness.light
      ? const Color(0xFF28a745)
      : const Color(0xFF374151);
}
