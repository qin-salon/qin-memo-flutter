import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/providers/user_provider.dart';
import 'package:qin_memo/widgets/dialog/profile_dialog.dart';

class AppBarIconButton extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final avatarUrl =
        useProvider(userProvider.select((value) => value.user?.avatarUrl));

    return GestureDetector(
      onTap: () => <void>{
        showGeneralDialog(
          barrierLabel: 'Dismiss',
          barrierDismissible: true,
          barrierColor: Colors.black.withOpacity(0.5),
          transitionDuration: const Duration(milliseconds: 200),
          context: context,
          pageBuilder: (BuildContext context, _, __) {
            return ProfileDialog();
          },
          transitionBuilder:
              (BuildContext context, Animation<double> anim1, _, Widget child) {
            return SlideTransition(
              position: Tween<Offset>(
                      begin: const Offset(0, 0), end: const Offset(0, 0.01))
                  .animate(anim1),
              child: child,
            );
          },
        )
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 24),
        child: Container(
          width: 36,
          height: 36,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(9999),
              child: Image.network(
                avatarUrl ??
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                errorBuilder: (_, __, ___) {
                  return Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                      fit: BoxFit.fitHeight);
                },
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
