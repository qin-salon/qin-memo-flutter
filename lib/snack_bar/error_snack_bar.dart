import 'package:flutter/material.dart';

void showErrorSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: const Text(
        'エラーが発生しました',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      duration: const Duration(milliseconds: 1000),
      width: 162,
      behavior: SnackBarBehavior.floating,
      backgroundColor: const Color(0xFFEF4444),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(999),
      ),
    ),
  );
}
