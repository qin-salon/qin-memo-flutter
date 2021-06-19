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
      backgroundColor: Theme.of(context).colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(999),
      ),
    ),
  );
}
