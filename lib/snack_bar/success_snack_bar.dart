import 'package:flutter/material.dart';

void showSuccessSnackBar(
    {required BuildContext context,
    required Widget content,
    required double width}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: content,
      duration: const Duration(milliseconds: 1000),
      width: width,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(999),
      ),
    ),
  );
}
