import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/authentication.dart';
import 'package:qin_memo/dialog/custom_alert_dialog.dart';
import 'package:qin_memo/models/user_model.dart';
import 'package:qin_memo/providers/user_provider.dart';
import 'package:qin_memo/qin_account/qin_account_page.dart';
import 'package:qin_memo/setting/setting_page.dart';

class ProfileDialog extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final User? user = useProvider(userProvider.select((value) => value.user));

    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 8),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute<QinAccountPage>(
                          builder: (BuildContext context) {
                        return QinAccountPage();
                      }),
                    );
                  },
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 48,
                          height: 48,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(
                              user?.avatarUrl ??
                                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute<QinAccountPage>(
                                  builder: (BuildContext context) {
                                return QinAccountPage();
                              }),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                user?.name ?? '',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF070417),
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              Text(
                                user?.accountId != null
                                    ? '@${user?.accountId}'
                                    : '',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFFC2C6D2),
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                  ),
                ),
                DialogOption(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute<SettingPage>(
                          builder: (BuildContext context) {
                        return SettingPage();
                      }),
                    );
                  },
                  icon: const Icon(Icons.settings_outlined),
                  text: const Text(
                    '設定',
                    style: TextStyle(
                      color: Color(0xFF070417),
                      fontSize: 14,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                DialogOption(
                  onTap: () async => <void>{
                    Navigator.of(context).pop(),
                    await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomAlertDialog(
                          title: 'ログアウト',
                          subText: 'ログアウトしますか？',
                          actionText: 'ログアウト',
                          action: () async {
                            await signOut();
                            Navigator.of(context).pop();
                          },
                        );
                      },
                    )
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: Color(0xFFEF4444),
                  ),
                  text: const Text(
                    'ログアウト',
                    style: TextStyle(
                      color: Color(0xFFEF4444),
                      fontSize: 14,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
            margin: const EdgeInsets.only(top: 100, left: 16, right: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
          ),
        ],
      ),
    );
  }
}

class DialogOption extends StatelessWidget {
  const DialogOption({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  final Icon icon;
  final Text text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: 44,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            icon,
            const SizedBox(width: 16),
            text,
          ],
        ),
      ),
    );
  }
}
