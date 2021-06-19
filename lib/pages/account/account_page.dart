import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/models/user_model.dart';
import 'package:qin_memo/providers/user_provider.dart';
import 'package:qin_memo/util/custom_color_scheme.dart';
import 'package:qin_memo/pages/account/account_connection_page.dart';
import 'package:qin_memo/pages/account/account_delete_page.dart';
import 'package:qin_memo/pages/account/account_profile_page.dart';
import 'package:qin_memo/pages/account/account_support_page.dart';
import 'package:qin_memo/pages/settings/setting_option.dart';

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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(9999),
                        child: Image.network(
                          user?.avatarUrl ??
                              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                          errorBuilder: (_, __, ___) {
                            return Image.network(
                                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                                fit: BoxFit.cover);
                          },
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text('ようこそ、${user?.name ?? ''}さん',
                      style: Theme.of(context).textTheme.subtitle1),
                  const SizedBox(height: 8),
                  Text('Qinアカウントに関する各種設定ができます。',
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: Theme.of(context).colorScheme.subTextColor)),
                ],
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '全般',
                  style: Theme.of(context).textTheme.subtitle2,
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
