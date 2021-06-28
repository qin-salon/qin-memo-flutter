import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/models/user_model.dart';
import 'package:qin_memo/pages/account/account_app_bar.dart';
import 'package:qin_memo/providers/user_provider.dart';
import 'package:qin_memo/util/custom_color_scheme.dart';
import 'package:qin_memo/pages/account/account_connection_page.dart';
import 'package:qin_memo/pages/account/account_delete_page.dart';
import 'package:qin_memo/pages/account/account_profile_page.dart';
import 'package:qin_memo/pages/account/account_support_page.dart';
import 'package:qin_memo/widgets/list_options/list_option.dart';

class AccountPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final User? user = useProvider(userProvider.select((value) => value.user));

    return Scaffold(
      appBar: AccountAppBar(icon: const Icon(Icons.close)),
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
                      child: ClipOval(
                        child: Image.network(
                          user?.avatarUrl ??
                              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                          errorBuilder: (_, __, ___) {
                            return Image.network(
                                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                                fit: BoxFit.cover);
                          },
                          fit: BoxFit.cover,
                          width: 72,
                          height: 72,
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
                ListOption(
                  text: 'プロフィール',
                  action: () {
                    Navigator.of(context).push<AccountProfilePage>(
                      MaterialPageRoute<AccountProfilePage>(
                          builder: (BuildContext context) {
                        return AccountProfilePage();
                      }),
                    );
                  },
                ),
                ListOption(
                  text: 'アカウントの連携',
                  action: () {
                    Navigator.of(context).push<AccountConnectionPage>(
                      MaterialPageRoute<AccountConnectionPage>(
                          builder: (BuildContext context) {
                        return AccountConnectionPage();
                      }),
                    );
                  },
                ),
                ListOption(
                  text: 'データの削除',
                  action: () {
                    Navigator.of(context).push<AccountDeletePage>(
                      MaterialPageRoute<AccountDeletePage>(
                          builder: (BuildContext context) {
                        return AccountDeletePage();
                      }),
                    );
                  },
                ),
                ListOption(
                  text: 'サポート',
                  action: () {
                    Navigator.of(context).push<AccountSupportPage>(
                      MaterialPageRoute<AccountSupportPage>(
                          builder: (BuildContext context) {
                        return AccountSupportPage();
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
