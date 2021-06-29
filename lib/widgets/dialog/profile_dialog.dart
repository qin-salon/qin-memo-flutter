import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/models/authentication.dart';
import 'package:qin_memo/widgets/custom_circle_avatar.dart';
import 'package:qin_memo/widgets/dialog/custom_alert_dialog.dart';
import 'package:qin_memo/models/user_model.dart';
import 'package:qin_memo/providers/user_provider.dart';
import 'package:qin_memo/pages/account/account_page.dart';
import 'package:qin_memo/pages/settings/setting_page.dart';
import 'package:qin_memo/pages/walkthrough/walkthrough_page.dart';

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
                      MaterialPageRoute<AccountPage>(
                        builder: (BuildContext context) {
                          return AccountPage();
                        },
                        fullscreenDialog: true,
                      ),
                    );
                  },
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CustomCircleAvatar(
                            size: 48, avatarUrl: user?.avatarUrl),
                        const SizedBox(width: 12),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute<AccountPage>(
                                builder: (BuildContext context) {
                                  return AccountPage();
                                },
                                fullscreenDialog: true,
                              ),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                user?.name ?? '',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.color),
                              ),
                              Text(
                                user?.accountId != null
                                    ? '@${user?.accountId}'
                                    : '',
                                style: Theme.of(context).textTheme.caption,
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
                        },
                        fullscreenDialog: true,
                      ),
                    );
                  },
                  icon: const Icon(Icons.settings_outlined),
                  text: Text(
                    '設定',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1?.color,
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
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute<WalkthroughPage>(
                              builder: (BuildContext context) {
                                return WalkthroughPage();
                              },
                            ), (Route<dynamic> route) => false);
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
              color: Theme.of(context).dialogBackgroundColor,
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
