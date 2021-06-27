import 'package:flutter/material.dart';
import 'package:qin_memo/widgets/snack_bar/top_snack_bar.dart';

void showSuccessSnackBar(
    {required BuildContext context,
    required Widget content,
    required double width}) {
  final overlayState = Overlay.of(context);
  final overlayEntry = OverlayEntry(builder: (context) {
    return TopSnackBar(
      content: content,
      width: width,
      color: Theme.of(context).colorScheme.primary,
    );
  });
  overlayState?.insert(overlayEntry);
}
