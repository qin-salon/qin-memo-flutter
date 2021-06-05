import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/models/user_model.dart';
import 'package:qin_memo/providers/user_provider.dart';
import 'package:qin_memo/qin_account/qin_account_connection_page.dart';
import 'package:qin_memo/qin_account/qin_account_delete_page.dart';
import 'package:qin_memo/qin_account/qin_account_profile_page.dart';
import 'package:qin_memo/qin_account/qin_account_support_page.dart';
import 'package:qin_memo/setting/setting_option.dart';

class QinAccountPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final User? user = useProvider(userProvider.select((value) => value.user));

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Padding(
            padding: EdgeInsets.only(left: 24),
            child: Icon(Icons.close),
          ),
        ),
        title: const Text('Qinアカウント'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 72,
                    height: 72,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(user?.avatarUrl ??
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text('ようこそ、${user?.name ?? ''}さん',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('Qinアカウントに関する各種設定ができます。',
                      style: TextStyle(fontSize: 12, color: Color(0xFFC2C6D2))),
                ],
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  '全般',
                  style: TextStyle(fontSize: 14, color: Color(0xFFC2C6D2)),
                ),
                const SizedBox(height: 8),
                SettingOption(
                  text: 'プロフィール',
                  action: () {
                    Navigator.of(context).push<QinAccountProfilePage>(
                      MaterialPageRoute<QinAccountProfilePage>(
                          builder: (BuildContext context) {
                        return QinAccountProfilePage();
                      }),
                    );
                  },
                ),
                SettingOption(
                  text: 'アカウントの連携',
                  action: () {
                    Navigator.of(context).push<QinAccountConnectionPage>(
                      MaterialPageRoute<QinAccountConnectionPage>(
                          builder: (BuildContext context) {
                        return QinAccountConnectionPage();
                      }),
                    );
                  },
                ),
                SettingOption(
                  text: 'データの削除',
                  action: () {
                    Navigator.of(context).push<QinAccountDeletePage>(
                      MaterialPageRoute<QinAccountDeletePage>(
                          builder: (BuildContext context) {
                        return QinAccountDeletePage();
                      }),
                    );
                  },
                ),
                SettingOption(
                  text: 'サポート',
                  action: () {
                    Navigator.of(context).push<QinAccountSupportPage>(
                      MaterialPageRoute<QinAccountSupportPage>(
                          builder: (BuildContext context) {
                        return QinAccountSupportPage();
                      }),
                    );
                  },
                ),
              ],
            ),
            padding: const EdgeInsets.all(24),
          ),
        ],
      ),
    );
  }
}
