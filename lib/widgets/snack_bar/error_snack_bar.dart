import 'package:flutter/material.dart';
import 'package:qin_memo/widgets/snack_bar/top_snack_bar.dart';

void showErrorSnackBar(BuildContext context) {
  final overlayState = Overlay.of(context);
  final overlayEntry = OverlayEntry(builder: (context) {
    return TopSnackBar(
      content: const Center(
        child: Text(
          'エラーが発生しました',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            decoration: TextDecoration.none,
          ),
        ),
      ),
      width: 162,
      color: Theme.of(context).colorScheme.error,
    );
  });
  overlayState?.insert(overlayEntry);
}
